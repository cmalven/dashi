root = exports ? this

class root.PanelManager
  constructor: (@options) ->
    @panels = []

    Deps.autorun =>
      Session.get('window_width')
      Session.get('window_height')
      @_updateInternalGridUnits()
      @_updatePackeryGrid()

    Panels.find().observeChanges
      removed: (id) =>
        el = $("##{id}-panel")[0]
        @packery.remove(el)

    @_initializePackery()

  add: (panel) ->
    @panels.push panel
    @_addPanelToPackery(panel)

  layout: ->
    @packery?.layout()
    
  _initializePackery: () =>
    container = document.querySelector('#panels')
    @packery = new Packery(
      container,
      {
        columnWidth: @grid_size_x
        rowHeight: @grid_size_y
        gutter: Session.get 'grid_spacing'
      }
    )

    @packery.on 'dragItemPositioned', (packeryInstance, draggedItem) =>
      @_updateItemPosition draggedItem.element.attributes['data-panel-id'].value, draggedItem
      @_saveItemOrder()

    @packery.on 'layoutComplete', (packeryInstance, laidOutItems) =>
      _.each laidOutItems, (item) =>
        @_updateItemPosition item.element.attributes['data-panel-id'].value, item
      @_saveItemOrder()

  _addPanelToPackery: (panel) ->
    pckry = @packery
    item = panel.panel.el
    pckry.addItems item
    draggie = new Draggabilly item
    pckry.bindDraggabillyEvents draggie

    # Fit the panel if it was just created
    timeAgo = moment().diff moment(panel.panel.createdAt)
    pckry.fit(panel.panel.el) if timeAgo < 2000

  _updatePackeryGrid: () ->
    @packery?.options.columnWidth = @grid_size_x
    @packery?.options.rowHeight = @grid_size_y

  _updateInternalGridUnits: =>
    @grid_size_x = gridUnits.width()
    @grid_size_y = gridUnits.height()

  _updateItemPosition: (panelId, item) =>
    update Panels, panelId,
      'pos_x': @_getGridPlacementFromPosition item.position.x, 'x'
      'pos_y': @_getGridPlacementFromPosition item.position.y, 'y'

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
      