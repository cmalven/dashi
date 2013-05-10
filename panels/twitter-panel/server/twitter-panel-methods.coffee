Meteor.methods

  fetchTweets: (search) ->
    url = 'http://search.twitter.com/search.json?q=' + search

    result = Meteor.http.get url
    if result.statusCode is 200
      return JSON.parse result.content
    else
      errorJson = JSON.parse(result.content)
      throw new Meteor.Error(result.statusCode, errorJson.error)