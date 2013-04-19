root = exports ? this

class root.Panel
  constructor: (@options) ->

    # Initialization
    @_setCssClass()
    @_update()

    # Start Update Interval
    Meteor.setInterval @_update, @options.updateInterval

    $(window).on 'resize', @_updateSize
    $(window).trigger 'resize'

  _updateSize: (evt) =>
    ww = $(window).width()
    wh = $(window).height()
    gridUnitX = ww / Session.get('grid_units_x')
    gridUnitY = wh / Session.get('grid_units_y')

    # Calculate Position
    posX = @options.gridPosX * gridUnitX
    posY = @options.gridPosY * gridUnitY

    #Apply Size and Position
    update Panels, @options._id,
      'pos_x_px': posX + 'px'
      'pos_y_px': posY + 'px'

  _setCssClass: ->
    update Panels, @options._id,
      'css_class': @options.panelCssClass

  _update: ->
    # This will implemented by panels that extend this class