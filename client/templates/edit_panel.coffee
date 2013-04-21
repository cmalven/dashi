root = exports ? this

Template.edit_panel.params = ->
  currentPanel = @
  sourcePanel = PanelOptions.findOne({panelName: @panelName})
  allParams = _.union sourcePanel.params.optional, sourcePanel.params.required
  return params = _.map allParams, (param) ->
    item = {}
    item.label = slang.capitalizeWords(param.name.replace(/_/g, ' '))
    item.value = currentPanel[param.name]
    return item

Template.edit_panel.preserve ['.edit-panel']

Template.edit_panel.events
  'click .button-square--cancel': (evt, template) ->
    Session.set 'panel_being_edited', null

  'click input': (evt, template) ->
    $(evt.target).focus()
