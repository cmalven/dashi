root = exports ? this

class root.CtaTrainPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'ctatrain'

    super(@panel)

  _update: =>
    that = @
    Meteor.call 'fetchTrains', @panel.station_id, (error, result) ->
      result = $.xml2json(result)
      console.log 'ctatrain-data', result if result
      console.log 'ctatrain-data-error', error if error
      return if error
      
      update Panels, that.panel._id,
        'stops': result.eta
