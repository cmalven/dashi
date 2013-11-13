Template.dashboard_list.helpers

  dashboards: ->
    Dashboards.find()

Template.dashboard_list.events
  'click .js-new-dashboard': (evt) ->
    Meteor.call 'addDashboard', (error, result) =>
      Router.go 'dashboard_show', {_id: result}
