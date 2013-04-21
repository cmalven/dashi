root = exports ? this

class root.MessagePanel extends Panel
  constructor: (@options) ->
    # Default settings
    settings =
      panelCssClass: 'message'

    # Merge default settings with options.
    @options = $.extend settings, @options

    super(@options)

  _update: =>
    # Message stuff goes here
