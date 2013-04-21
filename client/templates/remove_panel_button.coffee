root = exports ? this

Template.remove_panel_button.events
  'click .panel__remove-button': (evt, template) ->
    Meteor.call 'removePanel', template.data._id
