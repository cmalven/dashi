Template.dashboard_thumb.helpers

  panels: ->
    Panels.find({dashboard_id: @_id}, {sort: {panel_order: 1}})

  panel_class: ->
    return @css_class + '-panel'

  panel_width_css: ->
    unitsX = Session.get 'grid_units_x'
    width = (@grid_size_x / unitsX) * 100 - 4
    return createCss width, 'width', '%'

  panel_height_css: ->
    unitsY = Session.get 'grid_units_y'
    height = (@grid_size_y / unitsY) * 100 - 5
    return createCss height, 'height', '% !important'


  panel_left_css: ->


  panel_top_css: ->

