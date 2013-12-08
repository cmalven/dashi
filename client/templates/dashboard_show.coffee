root = exports ? this

Template.dashboard_show.helpers

  panels: ->
    dashboardId = Session.get('dashboard_id')
    Panels.find({dashboard_id: dashboardId}, {sort: {panel_order: 1}})

  grid_margin: ->
    margin = Session.get 'grid_margin'
    "margin-top: #{margin}px; margin-left: #{margin}px;"