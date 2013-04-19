root = exports ? this

class root.PanelManager
  constructor: (@options) ->
    @panels = []

  add: (panel) ->
    @panels.push panel

  remove: (panel) ->
    # Not yet implemented

  getPanels: ->
    @panels