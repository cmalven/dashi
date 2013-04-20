root = exports ? this

class root.Panel
  constructor: (@options) ->

    # Initialization
    @_setCssClass()
    @_update()

    # Start Update Interval
    Meteor.setInterval @_update, @options.update_interval

  _setCssClass: ->
    update Panels, @options._id,
      'css_class': @options.panelCssClass

  _update: ->
    # This will implemented by panels that extend this class