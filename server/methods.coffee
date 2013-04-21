# Methods

Meteor.methods

  addPanel: (panelOptionName, opts) ->
    panelOption = PanelOptions.findOne({panelName: panelOptionName})

    # Error if missing any required params
    _.each panelOption.params.required, (param) ->
      if not opts[param.name]
        console.log "Missing the required #{param.name} param"
        Meteor.Error 300, "Missing the required #{param.name} param"
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