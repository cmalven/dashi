Meteor.methods

  fetchHelpScout: (mailboxId) ->
    url = "https://api.helpscout.net/v1/mailboxes/#{mailboxId}.json"

    result = Meteor.http.get url, { auth: process.env.HELP_SCOUT_API_KEY + ':X' }
    if result.statusCode is 200
      return JSON.parse result.content
    else
      errorJson = JSON.parse(result.content)
      throw new Meteor.Error(result.statusCode, errorJson.error)