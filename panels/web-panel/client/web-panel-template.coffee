root = exports ? this

Template.webpanel.helpers

  formatted_url: ->
    unless slang.startsWith @url, "http://" or slang.startsWith @url, "https://"
      formatted_url = "http://" + @url
    return formatted_url