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
    # Nothing here yet