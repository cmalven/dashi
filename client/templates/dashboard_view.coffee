root = exports ? this

Template.dashboard_view.panels = ->
  dashboardId = Session.get('dashboard_id')
  Panels.find({dashboard_id: dashboardId})