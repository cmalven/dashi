root = exports ? this

Template.edit_panel.params = ->
  return getPanelOptionParams @

Template.edit_panel.preserve ['.edit-panel']

Template.edit_panel.events
  'click .button-square--save': (evt, template) ->
    formContent = $(evt.target).closest('.panel').find('form').serializeObject()
    Meteor.call 'updatePanel', @_id, formContent, (error, result) =>
      Session.set 'panel_being_edited', null

  'click .button-square--cancel': (evt, template) ->
    Session.set 'panel_being_edited', null

  'click input': (evt, template) ->
    $(evt.target).focus()
