root = exports ? this

Template.dashboard_view.panels = ->
  dashboardId = Session.get('dashboard_id')
  Panels.find({dashboard_id: dashboardId})

Template.dashboard_view.rendered = ->
  # Create the panel manager on the first render
  if not @rendered
    root.panelManager = new PanelManager()
    @rendered = true

Template.dashboard_view.destroyed = ->
  root.panelManager = null

Template.dashboard_view.preserve
  '.panel[id]': (node) ->
    return node.id
