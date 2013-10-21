root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'TimePanel'
  panel_display_name: 'Time'
  params: {
    required: [

    ]
    optional: [
      {
        name: 'update_interval'
        default: 0.2
      }
    ]
  }