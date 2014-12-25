Template.index.helpers

  signedin: ->
    return Meteor.userId()

  dashboard: ->
    Session.get('dashboard_id')