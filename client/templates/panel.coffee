root = exports ? this

Template.panel.helpers

  panel_id: ->
    "#{@_id}-panel"

  dynamicTemplate: ->
    panelName = @panelName.toLowerCase()
    return Template[panelName]

  width_css: ->
    gutterWidth = Session.get('grid_spacing') * (@grid_size_x - 1)
    return createCss (@grid_size_x * gridUnits.width() + gutterWidth), 'width'

  height_css: ->
    gutterHeight = Session.get('grid_spacing') * (@grid_size_y - 1)
    return createCss (@grid_size_y * gridUnits.height() + gutterHeight), 'height'

  pos_y_css: ->
    return createCss (@pos_y * (gridUnits.height() + Session.get('grid_spacing'))), 'top'

  pos_x_css: ->
    return createCss (@pos_x * (gridUnits.width() + Session.get('grid_spacing'))), 'left'

  is_being_edited_class: ->
    if Session.get('panel_being_edited') is @_id then 'is-being-edited' else ''


Template.panel.rendered = ->
  if panelManager? and not @rendered
    opts = this.data
    opts.el = @find('.panel')
    panelManager.add new root[opts.panelName](opts)
    @rendered = true

Template.panel.events
  'click .js-decrease-width': (evt) ->
    update Panels, this._id,
      'grid_size_x': parseInt(this.grid_size_x, 10) - 1

  'click .js-increase-width': (evt) ->
    update Panels, this._id,
      'grid_size_x': parseInt(this.grid_size_x, 10) + 1

  'click .js-decrease-height': (evt) ->
    update Panels, this._id,
      'grid_size_y': parseInt(this.grid_size_y, 10) - 1

  'click .js-increase-height': (evt) ->
    update Panels, this._id,
      'grid_size_y': parseInt(this.grid_size_y, 10) + 1