root = exports ? this

class root.WebPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'web'

    super(@panel)

  _update: =>
    $("##{@panel._id}").find('iframe').src = @panel.url


