root = exports ? this

class root.Panel
  constructor: (@options) ->
    # Set defaults and make $el easy to grab
    @$el = @options.$el
    @options.gridWidth = 3
    @options.gridHeight = 2

    # Initialization
    @_setCssClass()
    @_update()
    $(window).on 'resize', @_updateSize
    $(window).trigger 'resize'

    # Start Update Interval
    Meteor.setInterval @_update, @options.updateInterval

  _updateSize: (evt) =>
    ww = $(window).width()
    wh = $(window).height()
    gridUnitX = ww / @options.gridWidth
    gridUnitY = wh / @options.gridHeight

    # Calculate Size
    # Adds one pixel to account for rounding errors
    width = @options.gridSizeX * gridUnitX + 1
    height = @options.gridSizeY * gridUnitY + 1

    # Calculate Position
    posX = @options.gridPosX * gridUnitX
    posY = @options.gridPosY * gridUnitY

    #Apply Size and Position
    @$el.closest('.panel').css
      width: width
      height: height
      left: posX
      top: posY
  _setCssClass: ->
    Panels.update(
      {_id: @options._id},
      {$set: 
        {
          'css_class': @options.panelCssClass
        }
      }
    )

  _update: ->
    # This will implemented by panels that extend this class