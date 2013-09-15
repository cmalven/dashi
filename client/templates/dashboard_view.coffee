root = exports ? this

Template.dashboard_view.helpers

  panels: ->
    dashboardId = Session.get('dashboard_id')
    Panels.find({dashboard_id: dashboardId})

  grid_margin: ->
    margin = Session.get 'grid_margin'
    "margin-top: #{margin}px; margin-left: #{margin}px;"
    

Template.dashboard_view.rendered = ->
  root.panelManager or= new PanelManager()

Template.dashboard_view.destroyed = ->
  root.panelManager = null
