root = exports ? this

class root.TimePanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'time'

    super(@panel)

  _update: =>
    now = moment()
    hour = now.format('h')
    minutes = now.format('mm')
    seconds = now.format('ss')
    date = now.format('dddd, MMM D')

    update Panels, @panel._id,
      'hour': hour
      'minutes': minutes
      'seconds': seconds
      'date': date

