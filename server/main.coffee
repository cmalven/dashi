# Publications

Meteor.publish 'dashboards', (dashboard_id) ->
  if dashboard_id?
    return Dashboards.find({_id: dashboard_id})
  else
    return Dashboards.find()

Meteor.publish 'panelOptions', ->
  return PanelOptions.find()

Meteor.publish 'panels', (dashboard_id) ->
  if dashboard_id?
    return Panels.find({dashboard_id: dashboard_id}, sort: 'panel_order')
  else
    return Panels.find()

Meteor.publish 'messages', (dashboard_id) ->
  return Messages.find({dashboard_id: dashboard_id})


# Reset the panel options
PanelOptions.remove({})
_.each panelOptionsArray, (panelOption) ->
  # Add shared defaults to each panel
  panelOption.params.optional.push(
    {
      name: 'grid_size_x'
      default: 2
      input_type: 'number'
      editable: false
    }
    {
      name: 'grid_size_y'
      default: 3
      input_type: 'number'
      editable: false
    }
  )
  PanelOptions?.insert panelOption


# Bootstrap the Dashboard if none exist

if not Dashboards.find().count()
  dashboard_id = Meteor.call 'addDashboard'

  # Bootstrap the Panels
  Meteor.call 'addPanel', 'TimePanel', dashboard_id,
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'WeatherPanel', dashboard_id,
    grid_size_x: 2
    grid_size_y: 4
    
  Meteor.call 'addPanel', 'CtaTrainPanel', dashboard_id,
    grid_size_x: 2
    grid_size_y: 2

  Meteor.call 'addPanel', 'TwitterPanel', dashboard_id,
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'WebPanel', dashboard_id,
    url: 'http://lunar.meteor.com'
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'HelpScoutPanel', dashboard_id,
    mailbox_id: '2724'
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'SemaphorePanel', dashboard_id,
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'HerokuPanel', dashboard_id,
    app_name: 'dashi'
    grid_size_x: 2
    grid_size_y: 2

  Meteor.call 'addMessage',
    message: 'Welcome to Dashi!'
    time: '2013-04-21T20:38:33-05:00'
    sender: 'Dashi',
    dashboard_id: dashboard_id


# Permissions

Dashboards.allow
  insert: ->
    return true
  update: ->
    return true
  remove: ->
    return false

Panels.allow
  insert: ->
    return false
  update: ->
    return true
  remove: ->
    return false

PanelOptions.allow
  insert: ->
    return false
  update: ->
    return false
  remove: ->
    return false