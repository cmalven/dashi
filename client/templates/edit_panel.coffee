root = exports ? this

Template.edit_panel.helpers
  
  panel_name: ->
    panel = Panels.findOne({_id: Session.get('panel_being_edited')})
    return panel.panelName if panel?

  params: ->
    panel = Panels.findOne({_id: Session.get('panel_being_edited')})
    return getPanelOptionParams panel if panel?

  is_panel_being_edited_class: ->
    return 'is-panel-being-edited' if Session.get 'panel_being_edited'

Template.edit_panel.preserve ['.edit-panel']


Template.edit_panel.events
  'click .button-square--save': (evt, template) ->
    formContent = $(evt.target).prev('form').serializeObject()
    Meteor.call 'updatePanel', Session.get('panel_being_edited'), formContent, (error, result) =>
      Session.set 'panel_being_edited', null

  'click .button-square--cancel': (evt, template) ->
    Session.set 'panel_being_edited', null

  'click input': (evt, template) ->
    $(evt.target).focus()
