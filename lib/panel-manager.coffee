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

  _initializePackery: () ->
    container = document.querySelector('#panels')
    @packery = new Packery(
      container,
      {
        columnWidth: @gridUnitWidth,
        rowHeight: @gridUnitHeight
      }
    )

    @packery.on 'dragItemPositioned', (packeryInstance, draggedItem) ->

      update Panels, draggedItem.element.attributes['data-panel-id'].value,
        'pos_x': if draggedItem.position.x is 0 then 0 else (draggedItem.position.x / Session.get('window_width'))
        'pos_y': if draggedItem.position.y is 0 then 0 else (draggedItem.position.y / Session.get('window_height'))

    @packery.on 'layoutComplete', (packeryInstance, laidOutItems) ->
      _.each laidOutItems, (item) ->
        update Panels, item.element.attributes['data-panel-id'].value,
        'pos_x': if item.position.x is 0 then 0 else floorToDecimals(item.position.x / Session.get('window_width'))
        'pos_y': if item.position.y is 0 then 0 else floorToDecimals(item.position.y / Session.get('window_height'))

  _addPanelToPackery: (panel) ->
    pckry = @packery
    item = panel.options.el
    pckry.addItems item
    draggie = new Draggabilly item
    pckry.bindDraggabillyEvents draggie

    # Fit the panel if it was just created
    timeAgo = moment().diff moment(panel.options.createdAt)
    pckry.fit(panel.options.el) if timeAgo < 2000

  _updatePackeryGrid: () ->
    @packery?.options.columnWidth = @gridUnitWidth
    @packery?.options.rowHeight = @gridUnitHeight

  _updateInternalGridUnits: =>
    @gridUnitWidth = floorToDecimals(Session.get('window_width') / Session.get('grid_units_x'))
    @gridUnitHeight = floorToDecimals(Session.get('window_height') / Session.get('grid_units_y'))