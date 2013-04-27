root = exports ? this

class root.WeatherPanel extends Panel
  constructor: (@options) ->
    # Default settings
    settings =
      panelCssClass: 'weather'
      url: 'https://api.forecast.io/forecast'

    # Merge default settings with options.
    @options = $.extend settings, @options

    # Add the geocoder for finding lat/lng by address
    @geocoder = new google.maps.Geocoder();

    super(@options)

  _update: =>
    that = @
    @_geocodeAddress @options.city, (location) =>
      url = "#{@options.url}/#{@options.forecast_api_key}/#{location}"
      Meteor.call 'fetch', url, (error, result) ->
        result = JSON.parse(result)
        console.log 'weather-data', result
        update Panels, that.options._id,
          'current_summary': result.currently.summary
          'current_icon': result.currently.icon
          'current_temperature': result.currently.temperature

  _geocodeAddress: (address, callback) =>
    @geocoder.geocode(
      {'address': address},
      (results, status) ->
        if status is google.maps.GeocoderStatus.OK
          location = results[0].geometry.location
          callback "#{location.jb},#{location.kb}"
        else
          console.log "Geocode was not successful for the following reason: #{status}"
    )
