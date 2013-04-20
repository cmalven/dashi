root = exports ? this

class root.TimePanel extends Panel
  constructor: (@options) ->
    # Default settings
    settings =
      panelCssClass: 'time'

    # Merge default settings with options.
    @options = $.extend settings, @options
    super(@options)

  _update: =>
    now = moment()
    hour = now.format('h')
    minutes = now.format('mm')
    seconds = now.format('ss')
    date = now.format('dddd, MMM D')

    update Panels, @options._id,
      'hour': hour
      'minutes': minutes
      'seconds': seconds
      'date': date

