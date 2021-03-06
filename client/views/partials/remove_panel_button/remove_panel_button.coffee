root = exports ? this

Template.remove_panel_button.helpers

  confirm_visible_class: ->
    if Session.get('show_remove_confirm_button') then 'is-visible' else ''


Template.remove_panel_button.events
  'click .panel__remove-button': (evt, template) ->
    if Session.get 'show_remove_confirm_button'
      Session.set 'show_remove_confirm_button', false
    else
      Session.set 'show_remove_confirm_button', true

  'click .panel__remove-button__confirm__confirm': (evt, template) ->
    Meteor.call 'removePanel', template.data._id

  'click .panel__remove-button__confirm__cancel': (evt, template) ->
    Session.set 'show_remove_confirm_button', true
