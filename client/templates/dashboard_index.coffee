Template.dashboard_index.helpers

Template.dashboard_index.events
  'click .js-new-dashboard': (evt) ->
    Meteor.call 'addDashboard', (error, result) =>
      Router.go('dashboard_show', {_id: result}) unless error?
