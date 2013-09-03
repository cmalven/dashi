Template.dashboard_list.helpers

  dashboards: ->
    Dashboards.find()

Template.dashboard_list.events
  'click .js-new-dashboard': (evt) ->
    Meteor.call 'addDashboard', (error, result) =>
      Router.navigate("dashboard/#{result}", {trigger: true})
