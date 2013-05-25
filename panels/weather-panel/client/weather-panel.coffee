root = exports ? this

class root.WeatherPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'weather'

    # Add the geocoder for finding lat/lng by address
    @geocoder = new google.maps.Geocoder();

    super(@panel)

  _update: =>
    that = @
    @_geocodeAddress @panel.city, (location) =>
      Meteor.call 'fetchWeather', location, (error, result) ->
        console.log 'weather-data', result if result
        console.log 'weather-data-error', error if error
        return if error

        update Panels, that.panel._id,
          'current_summary': result.currently.summary
          'current_icon': result.currently.icon
          'current_temperature': Math.round result.currently.temperature

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
