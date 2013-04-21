# Configure the Dashboards and Panels

# Reset the panel options
PanelOptions.remove({})
panelOptionsArray = [
  {
    panelName: 'WeatherPanel'
    params: {
      required: [
        {
          name: 'api_key'
        }
      ]
      optional: [
        {
          name: 'city'
          default: 'Chicago'
        }
        {
          name: 'location'
          default: '41.850,-87.629'
        }
        {
          name: 'grid_size_x'
          default: 1
        }
        {
          name: 'grid_size_y'
          default: 1
        }
        {
          name: 'update_interval'
          default: 300000
        }
        {
          name: 'dashboard_id'
          default: '001'
        }
      ]
    }
  }
  {
    panelName: 'TimePanel'
    params: {
      required: [

      ]
      optional: [
        {
          name: 'grid_size_x'
          default: 1
        }
        {
          name: 'grid_size_y'
          default: 1
        }
        {
          name: 'update_interval'
          default: 20000
        }
        {
          name: 'dashboard_id'
          default: '001'
        }
      ]
    }
  }
  {
    panelName: 'MessagePanel'
    params: {
      required: [

      ]
      optional: [
        {
          name: 'grid_size_x'
          default: 1
        }
        {
          name: 'grid_size_y'
          default: 1
        }
        {
          name: 'update_interval'
          default: 60000
        }
        {
          name: 'dashboard_id'
          default: '001'
        }
      ]
    }
  }
]
_.each panelOptionsArray, (panelOption) ->
  PanelOptions?.insert panelOption


# Bootstrap the Dashboard if none exist

if not Dashboards.find().count()
  dashboardsArray = [
    {
      _id: '001'
    }
  ]
  _.each dashboardsArray, (dashboard) ->
    Dashboards?.insert dashboard

  # Bootstrap the Panels
  Meteor.call 'addPanel', 'TimePanel',
    grid_size_x: 1
    grid_size_y: 1
    dashboard_id: '001'
    
  Meteor.call 'addPanel', 'WeatherPanel',
    api_key: '967742df1f62e1552f0d5e16301dab3b'
    grid_size_x: 1
    grid_size_y: 2
