root = exports ? this

Template.panel.panel_id = ->
  "#{@_id}-panel"

Template.panel.dynamicTemplate = ->
  panelName = @className.toLowerCase()
  return Template[panelName](@)

Template.panel.panel_width_percent = ->
  gridUnitsX = Session.get('grid_units_x')
  thisUnitsX = @gridSizeX
  thisPercentage = (thisUnitsX / gridUnitsX) * 100
  return thisPercentage + "%"

Template.panel.panel_height_percent = ->
  gridUnitsY = Session.get('grid_units_y')
  thisUnitsY = @gridSizeY
  thisPercentage = (thisUnitsY / gridUnitsY) * 100
  return thisPercentage + "%"

Template.panel.created = ->
  opts = this.data
  panelManager.add new root[opts.className](opts)