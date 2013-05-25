root = exports ? this

class root.TwitterPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'twitter'

    super(@panel)

  _update: =>
    that = @
    Meteor.call 'fetchTweets', @panel.search, (error, result) ->
      console.log 'twitter-data', result if result
      console.log 'twitter-data-error', error if error
      latestTweet = result.results[0]
      update Panels, that.panel._id,
        'latest_tweet_created': moment(latestTweet.created_at).fromNow()
        'latest_tweet_user': latestTweet.from_user_name
        'latest_tweet_text': latestTweet.text
