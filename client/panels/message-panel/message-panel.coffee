root = exports ? this

class root.MessagePanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'message'

    super(@panel)

  _update: =>
    # Message stuff goes here
