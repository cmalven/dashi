root = exports ? this

Template.edit_panel.preserve ['.edit-panel']

Template.edit_panel.events
  'click .button-square--cancel': (evt, template) ->
    Session.set 'panel_being_edited', null

  'click input': (evt, template) ->
    $(evt.target).focus()
