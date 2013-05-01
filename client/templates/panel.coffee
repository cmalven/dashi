root = exports ? this

Template.panel.panel_id = ->
  "#{@_id}-panel"

Template.panel.dynamicTemplate = ->
  panelName = @panelName.toLowerCase()
  return Template[panelName](@)

Template.panel.width_css = ->
  gridUnitX = floorToDecimals(Session.get('window_width') / Session.get('grid_units_x'))
  return createCss (@grid_size_x * gridUnitX), 'width'

Template.panel.height_css = ->
  gridUnitY = floorToDecimals(Session.get('window_height') / Session.get('grid_units_y'))
  return createCss (@grid_size_y * gridUnitY), 'height'

Template.panel.pos_y_css = ->
  return createCss (@pos_y * Session.get('window_height')), 'top'

Template.panel.pos_x_css = ->
  return createCss (@pos_x * Session.get('window_width')), 'left'

Template.panel.is_being_edited_class = ->
  if Session.get('panel_being_edited') is @_id then 'is-being-edited' else ''

Template.panel.rendered = ->
  if panelManager? and not @rendered
    opts = this.data
    opts.el = @find('.panel')
    panelManager.add new root[opts.panelName](opts)
    @rendered = true

Template.panel.preserve({
  '.panel[id]': (node) ->
    return node.id
})
