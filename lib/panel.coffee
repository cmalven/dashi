root = exports ? this

class root.Panel
  constructor: (@options) ->
    # Set defaults and make $el easy to grab
    @$el = @options.$el
    @options.gridWidth = 3
    @options.gridHeight = 2

    # Initialization
    @_addCssClass()
    @_update()
    $(window).on 'resize', @_updateSize
    $(window).trigger 'resize'

    # Start Update Interval
    Meteor.setInterval @_update, @options.updateInterval

  _addCssClass: ->
    @$el.closest('.panel').addClass "#{@options.panelCssClass}-panel"

  _updateSize: (evt) =>
    ww = $(window).width()
    wh = $(window).height()
    gridUnitX = ww / @options.gridWidth
    gridUnitY = wh / @options.gridHeight

    # Calculate Size
    width = @options.gridSizeX * gridUnitX
    height = @options.gridSizeY * gridUnitY

    # Calculate Position
    posX = @options.gridPosX * gridUnitX
    posY = @options.gridPosY * gridUnitY

    #Apply Size and Position
    @$el.closest('.panel').css
      width: width
      height: height
      left: posX
      top: posY

  _update: ->
    # This will implemented by panels that extend this class