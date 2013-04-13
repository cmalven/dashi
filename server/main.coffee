# Configure the Dashboard Modules

Panels.remove({})
panelsArray = [
  {
    class: "WeatherPanel"
    label: 'Super Weather'
    unitSize: 3
  }
  {
    class: "WeatherPanel"
    label: 'Extra Super Weather'
    unitSize: 3
  }
]
_.each panelsArray, (panel) ->
  Panels?.insert panel