root = exports ? this

class root.HerokuPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'heroku'

    super(@panel)

  _update: =>
    that = @
    Meteor.call 'fetchHeroku', @panel.app_name, (error, result) ->
      console.log 'heroku-data', result
      update Panels, that.panel._id,
        'releases': result