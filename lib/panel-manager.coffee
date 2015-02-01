root = exports ? this

class root.PanelManager
  constructor: (@options) ->
    @draggables = []

  add: (panel) ->
    @_addPanelToPackery(panel)

  layout: ->
    @packery?.layout()

  _addPanelToPackery: (panel) ->
    # Create Packery if this is the first added panel
    @_initializePackery()

    # Check to see if the panel has already been added
    el = panel.panel.el
    return if @packery.getItem(el)?

    # If the panel hasn't been added, add it and bind dragging
    @packery.addItems el
    @_bindDragging el

    # Fit the panel if it was just created
    timeAgo = moment().diff moment(panel.panel.createdAt)
    @packery.fit(el) if timeAgo < 2000

  _initializePackery: () =>
    return if @packery?

    # Create Packery
    container = document.querySelector('#panels')
    @packery = new Packery(
      container,
      {
        columnWidth: @grid_size_x
        rowHeight: @grid_size_y
        gutter: Session.get 'grid_spacing'
        isInitLayout: false
      }
    )

    # Listen for changes that require updates to packery
    @autorun = Tracker.autorun =>
      Session.get('window_width')
      Session.get('window_height')
      @_updateInternalGridUnits()
      @_updateGrids()

    @observeRemoved = Panels.find().observeChanges
      removed: (id) =>
        el = $("##{id}-panel")[0]
        @packery.remove(el) if el?

    # Bind dragging for each panel 
    _.each @packery.getItemElements(), (item) =>
      @_bindDragging item

    # Add dragging and layout events
    @packery.on 'dragItemPositioned', (packeryInstance, draggedItem) =>
      _.each packeryInstance.getItemElements(), (el) =>
        item = packeryInstance.getItem(el)
        @_updateItemPosition item.element.attributes['data-panel-id'].value, item.position
      @_saveItemOrder()

    # Perform initial panel layout
    @layout()

  _destroyPackery: =>
    # Bind dragging for each panel 
    @_unbindDragging()
    return unless @packery?
    @packery.destroy()
    @packery = null

    # Remove autorun/observers
    @observeRemoved.stop()
    @autorun.stop()

  _bindDragging: (el) =>
    # Dragging
    $item = $(el)
      .draggable()
      .resizable
        grid: [
          @grid_size_x + Session.get('grid_spacing'),
          @grid_size_y + Session.get('grid_spacing')
        ]
        handles:
          'nw': '#nwgrip', 
          'ne': '#negrip', 
          'sw': '#swgrip', 
          'se': '#segrip', 
          'n': '#ngrip', 
          'e': '#egrip', 
          's': '#sgrip', 
          'w': '#wgrip' 
    @draggables.push $item
    @packery.bindUIDraggableEvents $item

    # Resizing
    $item.on 'resizestop', @_stoppedResizing

  _stoppedResizing: (evt, ui) =>
    panelId = ui.element.data('panel-id')
    @_updateItemSizeAndPosition(panelId, ui.size, { x: ui.position.left, y: ui.position.top})

  _unbindDragging: (el) =>
    _.each @draggables, (draggable) ->
      draggable.off 'dragStart'
      draggable.off 'dragMove'
      draggable.off 'dragEnd'
    @draggables = []

  _updateGrids: () ->
    # Update Packery Grid
    @packery?.options.columnWidth = @grid_size_x
    @packery?.options.rowHeight = @grid_size_y

    # Update Draggable Item Grids
    packeryItems = @packery?.getItemElements()
    for item in packeryItems
      return unless $(item).data('draggable')
      $(item).draggable('option', 'grid', [ 
        @grid_size_x + Session.get('grid_spacing'),
        @grid_size_y + Session.get('grid_spacing')
      ])

  _updateInternalGridUnits: =>
    @grid_size_x = gridUnits.width()
    @grid_size_y = gridUnits.height()

  _updateItemPosition: (panelId, positionObject) =>
    update Panels, panelId,
      'pos_x': @_getGridPlacementFromPosition positionObject.x, 'x'
      'pos_y': @_getGridPlacementFromPosition positionObject.y, 'y'

  _updateItemSizeAndPosition: (panelId, size, positionObject) =>
    newUnitWidth = gridUnits.getUnitsForWidth(size.width)
    newUnitHeight = gridUnits.getUnitsForHeight(size.height)
    update Panels, panelId,
      'grid_size_x': newUnitWidth
      'grid_size_y': newUnitHeight
      'pos_x': @_getGridPlacementFromPosition positionObject.x, 'x'
      'pos_y': @_getGridPlacementFromPosition positionObject.y, 'y'

  _getGridPlacementFromPosition: (pos, axis) =>
    gridNum = Session.get "grid_units_#{axis}"
    gridSize = @["grid_size_#{axis}"]
    placement = Math.round(pos / (gridSize + Session.get('grid_spacing')))
    return placement

  _saveItemOrder: =>
    itemEls = @packery.getItemElements()
    for item, i in itemEls
      panelId = item.getAttribute 'id'
      update Panels, panelId.replace('-panel', ''),
        'panel_order': i
      