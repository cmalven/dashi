root = exports ? this

Template.edit_panel_button.events
  'click .panel__edit-button': (evt, template) ->
    Session.set 'panel_being_edited', template.data._id
