# Methods

Meteor.methods

  # Dashboards
  
  addDashboard: () ->
    return Dashboards.insert({})

  # Panels

  addPanel: (panelOptionName, dashboard_id, opts) ->
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
    newPanel = _.extend defaults, opts,
      panelName: panelOptionName,
      dashboard_id: dashboard_id,
      createdAt: moment().format()

    return Panels.insert newPanel

  removePanel: (panelId) ->
    return Panels.remove({_id: panelId})

  updatePanel: (panelId, opts) ->
    return update Panels, panelId, opts


  # Messages

  addMessage: (messageData) ->
    return Messages.insert messageData