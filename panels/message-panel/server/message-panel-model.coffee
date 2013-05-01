root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'MessagePanel'
  panel_display_name: 'Messages'
  params: {
    required: [

    ]
    optional: [
      {
        name: 'update_interval'
        default: 60000
      }
    ]
  }