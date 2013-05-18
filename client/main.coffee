root = exports ? this

# Subscriptions
Deps.autorun ->
  dashboard_id = Session.get('dashboard_id')
  Meteor.subscribe('panelOptions')
  Meteor.subscribe('dashboards', dashboard_id)
  Meteor.subscribe('panels', dashboard_id)
  Meteor.subscribe('messages', dashboard_id)

# Session Configuration
Session.set('grid_units_x', 6)
Session.set('grid_units_y', 4)
Session.set('grid_spacing', 50)

# Global Resize
$(window).on 'resize', (evt) ->
  Session.set 'window_width', $(window).width()
  Session.set 'window_height', $(window).height()

# Router
DashboardRouter = Backbone.Router.extend
  routes:
    '': 'index'
    'dashboard/:dashboard_id': 'dashboard'
  index: ->
    Session.set('dashboard_id', null)
  dashboard: (dashboard_id) ->
    Session.set('dashboard_id', dashboard_id)

Router = new DashboardRouter

Meteor.startup ->
  Backbone.history.start({pushState: true})
  $(window).trigger 'resize'

  # Listen for mouse movement
  $('body').on 'mousemove', (evt) ->
    $(this).addClass 'is-mouse-moving'
    Meteor.clearTimeout(root.mouseMoveTimeout)
    root.mouseMoveTimeout = Meteor.setTimeout( ->
      $('body').removeClass 'is-mouse-moving'
    , 2000)