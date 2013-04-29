root = exports ? this

Template.new_panel_dropdown.is_active = ->
  return Session.get('panel_being_created_id') is @_id

Template.new_panel_dropdown.params = ->
  return getPanelOptionParams @

Template.new_panel_dropdown.events
  'click .button-square--save': (evt, template) ->
    formContent = $(evt.target).closest('.new-panel-dropdown').find('form').serializeObject()
    Meteor.call 'addPanel', @panelName, formContent, (error, result) =>
      Session.set 'panel_being_created_id', null

  'click .button-square--cancel': (evt, template) ->
    Session.set 'panel_being_created_id', null