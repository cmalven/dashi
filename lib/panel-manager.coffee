root = exports ? this

class root.PanelManager
  constructor: (@options) ->
    @panels = []
    $(window).on 'resize', @_updateInternalGridUnits
    $(window).trigger 'resize'
    @_initializePackery()

  add: (panel) ->
    @panels.push panel
    @_addPanelToPackery(panel)

  remove: (panel) ->
    # Not yet implemented

  getPanels: ->
    @panels

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
        'pos_x': if draggedItem.position.x is 0 then 0 else (draggedItem.position.x / $(window).width())
        'pos_y': if draggedItem.position.y is 0 then 0 else (draggedItem.position.y / $(window).height())

    @packery.on 'layoutComplete', (packeryInstance, laidOutItems) ->
      _.each laidOutItems, (item) ->
        update Panels, item.element.attributes['data-panel-id'].value,
        'pos_x': if item.position.x is 0 then 0 else (item.position.x / $(window).width())
        'pos_y': if item.position.y is 0 then 0 else (item.position.y / $(window).height())

  _addPanelToPackery: (panel) ->
    pckry = @packery
    item = panel.options.el
    pckry.addItems item
    draggie = new Draggabilly item
    pckry.bindDraggabillyEvents draggie

  _updatePackeryGrid: () ->
    @packery.columnWidth = @gridUnitWidth
    @packery.rowHeight = @gridUnitHeight

  _updateInternalGridUnits: =>
    ww = $(window).width()
    wh = $(window).height()
    @gridUnitWidth = ww / Session.get('grid_units_x')
    @gridUnitHeight = wh / Session.get('grid_units_y')