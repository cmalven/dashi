Meteor.methods

  fetchTweets: (search) ->
    url = 'http://search.twitter.com/search.json?q=' + search

    throw new Meteor.Error(303, 'Twitter API disabled')
    # Twitter API disabled until updated for API 1.1
    #result = Meteor.http.get url
    #if result.statusCode is 200
    #  return JSON.parse result.content
    #else
    #  errorJson = JSON.parse(result.content)
    #  throw new Meteor.Error(result.statusCode, #errorJson.error)