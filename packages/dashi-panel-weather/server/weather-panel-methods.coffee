Meteor.methods

  fetchWeather: (location) ->
    url = 'https://api.forecast.io/forecast/' + process.env.FORECAST_API_KEY + '/' + location

    result = Meteor.http.get url
    if result.statusCode is 200
      return JSON.parse result.content
    else
      errorJson = JSON.parse(result.content)
      throw new Meteor.Error(result.statusCode, errorJson.error)