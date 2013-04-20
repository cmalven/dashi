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
    $.ajax
      url: "#{@options.url}/#{@options.api_key}/#{@options.location}"
      dataType: "jsonp"
      success: (data) ->
        console.log 'weather-data', data
        update Panels, that.options._id,
          'current_summary': data.currently.summary
          'current_icon': data.currently.icon
          'current_temperature': data.currently.temperature
