root = exports ? this

class root.WebPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'web'

    super(@panel)

  _update: =>
    # No update code necessary.


