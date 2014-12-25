root = exports ? this

Template.dashboard_show.helpers

  grid_margin: ->
    margin = Session.get 'grid_margin'
    "margin-top: #{margin}px; margin-left: #{margin}px;"