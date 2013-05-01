root = exports ? this
  
Template.messagepanel.latest_message = ->
  messages = Messages.find({}, {sort: {time: -1}}).fetch()
  latestMessage = messages[0]
  return if not latestMessage?
  latestMessage.time_ago = moment(latestMessage.time).fromNow()
  latestMessage.sender or= 'Anonymous'
  return latestMessage

Template.messagepanel.events
  'click form button': (evt, template) ->
    form = $(evt.target).closest('.panel').find('.message-panel__form')
    formContent = form.serializeObject()
    formContent.time = moment().format()
    formContent.dashboard_id = Session.get('dashboard_id')
    Meteor.call 'addMessage', formContent
    form.find('input').val('')
    evt.preventDefault()

  'click input': (evt, template) ->
    $(evt.target).focus()