root = exports ? this

class root.CtaTrainPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'ctatrain'
      url: 'http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=3654c77e9dcd4acaa89b6e5ded7fbf86&max=5&mapid=40710'

    super(@panel)

  _update: =>
    that = @
    url = "#{@settings.url}"
    Meteor.call 'fetch', url, (error, result) ->
      result = $.xml2json(result)
      console.log 'ctatrain-data', result
      update Panels, that.panel._id,
        'stops': result.eta
