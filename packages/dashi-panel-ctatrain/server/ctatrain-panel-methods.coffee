Meteor.methods

  fetchTrains: (stationId) ->
    url = 'http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=' + process.env.CTA_TRAIN_TRACKER_API_KEY + '&max=5&mapid=' + stationId

    result = Meteor.http.get url
    if result.statusCode is 200
      return result.content
    else
      errorJson = JSON.parse(result.content)
      throw new Meteor.Error(result.statusCode, errorJson.error)