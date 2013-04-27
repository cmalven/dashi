root = exports ? this

Template.dashboard_view.panels = ->
  dashboardId = Session.get('dashboard_id')
  Panels.find({dashboard_id: dashboardId})

Template.dashboard_view.rendered = ->
  root.panelManager or= new PanelManager()

Template.dashboard_view.destroyed = ->
  root.panelManager = null
