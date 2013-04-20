root = exports ? this

class root.Panel
  constructor: (@options) ->

    # Initialization
    @_setCssClass()
    @_update()

    # Start Update Interval
    Meteor.setInterval @_update, @options.update_interval

    $(window).on 'resize', @_updateSize
    $(window).trigger 'resize'

  _updateSize: (evt) =>
    ww = $(window).width()
    wh = $(window).height()
    Session.set 'window_width', ww
    Session.set 'window_height', wh

  _setCssClass: ->
    update Panels, @options._id,
      'css_class': @options.panelCssClass

  _update: ->
    # This will implemented by panels that extend this class