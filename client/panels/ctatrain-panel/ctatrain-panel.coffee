root = exports ? this

class root.CtaTrainPanel extends Panel
  constructor: (@options) ->
    # Default settings
    settings =
      panelCssClass: 'ctatrain'
      url: 'http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=3654c77e9dcd4acaa89b6e5ded7fbf86&max=5&mapid=40710'

    # Merge default settings with options.
    @options = $.extend settings, @options

    super(@options)

  _update: =>
    that = @
    url = "#{@options.url}"
    Meteor.call 'fetch', url, (error, result) ->
      result = $.xml2json(result)
      console.log 'ctatrain-data', result
      update Panels, that.options._id,
        'stops': result.eta
