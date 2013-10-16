root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'TwitterPanel'
  panel_display_name: 'Twitter'
  params: {
    required: [

    ]
    optional: [
      {
        name: 'update_interval'
        default: 3
      }
      {
        name: 'search'
        default: 'meteorjs'
      }
    ]
  }