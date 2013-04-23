root = exports ? this

class root.WeatherPanel extends Panel
  constructor: (@options) ->
    # Default settings
    settings =
      panelCssClass: 'weather'
      url: 'https://api.forecast.io/forecast'

    # Merge default settings with options.
    @options = $.extend settings, @options

    super(@options)

  _update: =>
    that = @
    url = "#{@options.url}/#{@options.api_key}/#{@options.location}"
    Meteor.call 'fetch', url, (error, result) ->
      console.log 'weather-data', result
      update Panels, that.options._id,
        'current_summary': result.currently.summary
        'current_icon': result.currently.icon
        'current_temperature': result.currently.temperature