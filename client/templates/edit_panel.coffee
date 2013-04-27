root = exports ? this

Template.edit_panel.params = ->
  currentPanel = @
  sourcePanel = PanelOptions.findOne({panelName: @panelName})
  allParams = _.union sourcePanel.params.optional, sourcePanel.params.required
  # Filter out non-editable params
  allParams = _.filter allParams, (param) ->
    return not param.editable? or param.editable
  return params = _.map allParams, (param) ->
    item = {}
    item.label = slang.capitalizeWords(param.name.replace(/_/g, ' '))
    item.name = param.name
    item.value = currentPanel[param.name]
    return item

Template.edit_panel.preserve ['.edit-panel']

Template.edit_panel.events
  'click .button-square--save': (evt, template) ->
    formContent = $(evt.target).closest('.panel').find('form').serializeObject()
    Meteor.call 'updatePanel', @_id, formContent
    Session.set 'panel_being_edited', null

  'click .button-square--cancel': (evt, template) ->
    Session.set 'panel_being_edited', null

  'click input': (evt, template) ->
    $(evt.target).focus()
