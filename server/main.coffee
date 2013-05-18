# Publications

Meteor.publish 'dashboards', (dashboard_id) ->
  if dashboard_id?
    return Dashboards.find({_id: dashboard_id})
  else
    return Dashboards.find(_id: '001')

Meteor.publish 'panelOptions', ->
  return PanelOptions.find()

Meteor.publish 'panels', (dashboard_id) ->
  return Panels.find({dashboard_id: dashboard_id})

Meteor.publish 'messages', (dashboard_id) ->
  return Messages.find({dashboard_id: dashboard_id})


# Configure the Dashboards and Panels

# Reset the panel options
PanelOptions.remove({})
_.each panelOptionsArray, (panelOption) ->
  # Add shared defaults to each panel
  panelOption.params.optional.push(
    {
      name: 'grid_size_x'
      default: 2
      input_type: 'number'
    }
    {
      name: 'grid_size_y'
      default: 2
      input_type: 'number'
    }
    {
      name: 'dashboard_id'
      default: '001'
      editable: false
    }
  )
  PanelOptions?.insert panelOption


# Bootstrap the Dashboard if none exist

if not Dashboards.find().count()
  dashboardsArray = [
    {
      _id: '001'
      title: 'Default'
    }
  ]
  _.each dashboardsArray, (dashboard) ->
    Dashboards?.insert dashboard

  # Bootstrap the Panels
  Meteor.call 'addPanel', 'TimePanel',
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'WeatherPanel',
    grid_size_x: 2
    grid_size_y: 4
    
  Meteor.call 'addPanel', 'CtaTrainPanel',
    grid_size_x: 2
    grid_size_y: 2

  Meteor.call 'addPanel', 'TwitterPanel',
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'WebPanel',
    url: 'http://lunar.meteor.com'
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'HelpScoutPanel',
    mailbox_id: '2724'
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'SemaphorePanel',
    project_hash_id: 'fc557c693e9ba7ad2b2794095217469a7dea29bb'
    branch_id: '11132'
    grid_size_x: 2
    grid_size_y: 2

  Meteor.call 'addMessage',
    dashboard_id: '001'
    message: 'Welcome to Dashi!'
    time: '2013-04-21T20:38:33-05:00'
    sender: 'Dashi'


# Permissions

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