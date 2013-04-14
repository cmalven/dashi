# Configure the Dashboard Modules

Panels.remove({})
panelsArray = [
  {
    className: 'WeatherPanel'
    label: 'Super Weather'
    apiKey: '0c855ed921ab424daf5c473694e00858'
    city: 'Chicago'
    location: '41.850,-87.629'
    gridSizeX: 1
    gridSizeY: 1
    gridPosX: 2
    gridPosY: 1
    updateInterval: 300000
  }
  {
    className: 'WeatherPanel'
    label: 'Extra Super Weather'
    apiKey: '0c855ed921ab424daf5c473694e00858'
    city: 'San Francisco'
    location: '37.775,-122.418'
    gridSizeX: 1
    gridSizeY: 2
    gridPosX: 0
    gridPosY: 0
    updateInterval: 200000
  }
  {
    className: 'WeatherPanel'
    label: 'Awesomest Super Weather'
    apiKey: '0c855ed921ab424daf5c473694e00858'
    city: 'New York'
    location: '40.714,-74.006'
    gridSizeX: 1
    gridSizeY: 1
    gridPosX: 1
    gridPosY: 0
    updateInterval: 400000
  }
]
_.each panelsArray, (panel) ->
  Panels?.insert panel