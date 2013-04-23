# Methods

Meteor.methods

  addPanel: (panelOptionName, opts) ->
    panelOption = PanelOptions.findOne({panelName: panelOptionName})

    # Error if missing any required params
    _.each panelOption.params.required, (param) ->
      if not opts[param.name]
        throw new Meteor.Error 300, "Missing the required #{param.name} param"
        return false

    # Grab all default params
    defaults = {}
    _.each panelOption.params.optional, (param) ->
      defaults[param.name] = param.default

    # Extend the panel defaults with the passed opts
    newPanel = _.extend defaults, opts, {panelName: panelOptionName}

    return Panels.insert newPanel

  removePanel: (panelId) ->
    return Panels.remove({_id: panelId})

  updatePanel: (panelId, opts) ->
    console.log 'updating'
    console.log 'panelId', panelId
    console.log 'opts', opts
    return update Panels, panelId, opts

  addMessage: (messageData) ->
    return Messages.insert messageData

  fetch: (url) ->
    result = Meteor.http.get url
    if result.statusCode is 200
      return JSON.parse(result.content)
    else
      errorJson = JSON.parse(result.content)
      throw new Meteor.Error(result.statusCode, errorJson.error)