root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'HelpScoutPanel'
  panel_display_name: 'Help Scout'
  params: {
    required: [
      {
        name: 'mailbox_id'
      }
    ]
    optional: [
      
      {
        name: 'update_interval'
        default: 60
      }
    ]
  }
