# Configure the Dashboard Modules

Panels.remove({})
panelsArray = [
  {
    className: 'WeatherPanel'
    label: 'Super Weather'
    apiKey: '967742df1f62e1552f0d5e16301dab3b'
    city: 'Chicago'
    location: '41.850,-87.629'
    gridSizeX: 1
    gridSizeY: 1
    gridPosX: 2
    gridPosY: 0
    updateInterval: 300000
  }
  {
    className: 'TimePanel'
    label: 'Get the Time'
    gridSizeX: 1
    gridSizeY: 1
    gridPosX: 2
    gridPosY: 1
    updateInterval: 10000
  }
]
_.each panelsArray, (panel) ->
  Panels?.insert panel