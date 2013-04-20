root = exports ? this

Template.panel.panel_id = ->
  "#{@_id}-panel"

Template.panel.dynamicTemplate = ->
  panelName = @className.toLowerCase()
  return Template[panelName](@)

Template.panel.width_css = ->
  return createCss @width, 'width'

Template.panel.height_css = ->
  return createCss @height, 'height'

Template.panel.pos_y_css = ->
  return createCss @pos_y, 'top'

Template.panel.pos_x_css = ->
  return createCss @pos_x, 'left'

Template.panel.rendered = ->
  if not @rendered
    opts = this.data
    opts.el = @find('.panel')
    panelManager.add new root[opts.className](opts)
    @rendered = true