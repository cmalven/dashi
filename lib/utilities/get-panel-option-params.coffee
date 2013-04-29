root = exports ? this

root.getPanelOptionParams = (panelOption) ->
  currentPanel = panelOption

  sourcePanel = PanelOptions.findOne({panelName: currentPanel.panelName})
  allParams = _.union sourcePanel.params.optional, sourcePanel.params.required
  # Filter out non-editable params
  allParams = _.filter allParams, (param) ->
    return not param.editable? or param.editable
  return params = _.map allParams, (param) ->
    item = {}
    item.label = slang.capitalizeWords(param.name.replace(/_/g, ' '))
    item.name = param.name
    item.value = currentPanel[param.name]
    item.default = param.default
    return item