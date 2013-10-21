Meteor.methods

  fetchHeroku: (appName) ->
    url = "https://api.heroku.com/apps/#{appName}/releases"

    result = Meteor.http.get url, { headers: 'Accept: application/json', auth: ':' + process.env.HEROKU_API_KEY }
    if result.statusCode is 200
      return JSON.parse result.content
    else
      errorJson = JSON.parse(result.content)
      throw new Meteor.Error(result.statusCode, errorJson.error)