root = exports ? this

Template.panel.helpers

  panel_id: ->
    "#{@_id}-panel"

  dynamicTemplate: ->
    panelName = @panelName.toLowerCase()
    return Template[panelName](@)

  width_css: ->
    gutterWidth = Session.get('grid_spacing') * (@grid_size_x - 1)
    return createCss (@grid_size_x * gridUnits.width() + gutterWidth), 'width'

  height_css: ->
    gutterHeight = Session.get('grid_spacing') * (@grid_size_y - 1)
    return createCss (@grid_size_y * gridUnits.height() + gutterHeight), 'height'

  pos_y_css: ->
    return createCss (@pos_y * Session.get('window_height')), 'top'

  pos_x_css: ->
    return createCss (@pos_x * Session.get('window_width')), 'left'

  is_being_edited_class: ->
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
