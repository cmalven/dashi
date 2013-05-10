root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'WeatherPanel'
  panel_display_name: 'Weather'
  params: {
    required: [
      
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