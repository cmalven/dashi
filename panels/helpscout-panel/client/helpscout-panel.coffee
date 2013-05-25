root = exports ? this

class root.HelpScoutPanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'helpscout'

    super(@panel)

  _update: =>
    that = @
    Meteor.call 'fetchHelpScout', @panel.mailbox_id, (error, result) ->
      console.log 'helpscout-data', result if result
      console.log 'helpscout-data-error', error if error
      update Panels, that.panel._id,
        'name': result.item.name
        'open_conversations_count': that._countOpenConversations result.item.folders
  
  _countOpenConversations: (folders) ->
    count = 0

    _.each folders, (item) ->
      count += item.activeCount unless item.type is 'drafts'

    return count