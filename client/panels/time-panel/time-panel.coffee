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
    hour = now.format("h")
    minutes = now.format("mm")
    seconds = now.format("ss")

    Panels.update(
      {_id: @options._id},
      {$set: 
        {
          'hour': hour
          'minutes': minutes
          'seconds': seconds
        }
      }
    )
