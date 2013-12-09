Template.dashboard_index.helpers

  dashboards: ->
    Dashboards.find()

Template.dashboard_index.events
  'click .js-new-dashboard': (evt) ->
    Meteor.call 'addDashboard', (error, result) =>
      Router.go 'dashboard_show', {_id: result}
