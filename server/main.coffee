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
panelOptionsArray = [
  {
    panelName: 'CtaTrainPanel'
    panel_display_name: 'CTA Train'
    params: {
      required: [
        {
          name: 'api_key'
        }
      ]
      optional: [
        {
          name: 'station_id'
          default: '40710'
        }
        {
          name: 'update_interval'
          default: 220000
        }
      ]
    }
  }
  {
    panelName: 'WeatherPanel'
    panel_display_name: 'Weather'
    params: {
      required: [
        {
          name: 'forecast_api_key'
        }
      ]
      optional: [
        {
          name: 'city'
          default: 'Chicago'
        }
        {
          name: 'update_interval'
          default: 300000
        }
      ]
    }
  }
  {
    panelName: 'TimePanel'
    panel_display_name: 'Time'
    params: {
      required: [

      ]
      optional: [
        {
          name: 'update_interval'
          default: 20000
        }
      ]
    }
  }
  {
    panelName: 'WebPanel'
    panel_display_name: 'Web Snippet'
    params: {
      required: [
        {
          name: 'url'
        }
      ]
      optional: [
        {
          name: 'update_interval'
          default: 20000
        }
      ]
    }
  }
  {
    panelName: 'MessagePanel'
    panel_display_name: 'Messages'
    params: {
      required: [

      ]
      optional: [
        {
          name: 'update_interval'
          default: 60000
        }
      ]
    }
  }
]
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
    forecast_api_key: '967742df1f62e1552f0d5e16301dab3b'
    grid_size_x: 2
    grid_size_y: 4
    
  Meteor.call 'addPanel', 'CtaTrainPanel',
    api_key: '3654c77e9dcd4acaa89b6e5ded7fbf86'
    grid_size_x: 2
    grid_size_y: 2

  Meteor.call 'addPanel', 'MessagePanel',
    grid_size_x: 2
    grid_size_y: 2
    
  Meteor.call 'addPanel', 'WebPanel',
    url: 'http://lunar.meteor.com'
    grid_size_x: 2
    grid_size_y: 2

  Meteor.call 'addMessage',
    dashboard_id: '001'
    message: 'Welcome to Dashi!'
    time: '2013-04-21T20:38:33-05:00'
    sender: 'Dashi'
