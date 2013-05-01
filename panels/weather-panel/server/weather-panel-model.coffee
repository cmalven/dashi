root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
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