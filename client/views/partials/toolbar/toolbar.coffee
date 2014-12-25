root = exports ? this

Template.toolbar.helpers

  panel_options: ->
    PanelOptions.find()


Template.toolbar.events
  'click .toolbar__panel-options__link': (evt, template) ->
    evt.preventDefault()
    Session.set 'panel_being_created_id', @_id