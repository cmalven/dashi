Meteor.methods

  fetchTweets: (search) ->
    Twit = new TwitMaker
      consumer_key:         process.env.TWITTER_CONSUMER_KEY
      consumer_secret:      process.env.TWITTER_CONSUMER_SECRET
      access_token:         process.env.TWITTER_ACCESS_TOKEN
      access_token_secret:  process.env.TWITTER_ACCESS_TOKEN_SECRET

    Future = Npm.require('fibers/future')
    fut = new Future()
    Twit.get 'search/tweets', { q: search, count: 1 }, (error, result) ->
      if result
        fut['return'](result.statuses) if result
      else
        fut['return'](error)
    return fut.wait()