root = exports ? this

class root.Panel
  constructor: (@panel) ->

    # Initialization
    @_setCssClass()
    @_update()

    # Start Update Interval
    Meteor.setInterval @_update, @panel.update_interval

    # Update internal panel properties when updated
    Panels.find({_id: @panel._id}).observe
      changed: (id, fields) =>
        @panel = fields

  _setCssClass: ->
    update Panels, @panel._id,
      'css_class': @settings.panelCssClass

  _update: ->
    # This will implemented by panels that extend this class