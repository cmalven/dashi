Template.dashboards_index.helpers

Template.dashboards_index.events
  'click .js-new-dashboard': (evt) ->
    Meteor.call 'addDashboard', (error, result) =>
      Router.go('dashboard_show', {_id: result}) unless error?
