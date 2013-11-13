root = exports ? this

# Subscriptions
Deps.autorun ->
  dashboard_id = Session.get('dashboard_id')
  Meteor.subscribe('panelOptions')
  Meteor.subscribe('dashboards', dashboard_id)
  Meteor.subscribe('panels', dashboard_id)
  Meteor.subscribe('messages', dashboard_id)

  # Update panel-being-edited class on body
  if Session.get('panel_being_edited')
    $('body').addClass('is-panel-being-edited')
  else
    $('body').removeClass('is-panel-being-edited')

# Session Configuration
Session.set('grid_units_x', 6)
Session.set('grid_units_y', 6)
Session.set('grid_spacing', 50)
Session.set('grid_margin', 60)

# Global Resize
$(window).on 'resize', (evt) ->
  Session.set 'window_width', $(window).width()
  Session.set 'window_height', $(window).height()

Meteor.startup ->
  $(window).trigger 'resize'

  # Listen for mouse movement
  $('body').on 'mousemove', (evt) ->
    $(this).addClass 'is-mouse-moving'
    Meteor.clearTimeout(root.mouseMoveTimeout)
    root.mouseMoveTimeout = Meteor.setTimeout( ->
      $('body').removeClass 'is-mouse-moving'
    , 2000)