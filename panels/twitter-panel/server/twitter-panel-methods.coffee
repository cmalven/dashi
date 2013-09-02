Meteor.methods

  fetchTweets: (search) ->
    url = 'http://search.twitter.com/search.json?q=' + search

    return {
      results: [
        {
          createdAt: moment().format()
          from_user_name: 'Dashi'
          text: 'Twitter panel needs to be updated to API 1.1'
        }
      ]
    }
    # Twitter API disabled until updated for API 1.1
    #result = Meteor.http.get url
    #if result.statusCode is 200
    #  return JSON.parse result.content
    #else
    #  errorJson = JSON.parse(result.content)
    #  throw new Meteor.Error(result.statusCode, #errorJson.error)