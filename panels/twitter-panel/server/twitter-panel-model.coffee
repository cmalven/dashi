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
        default: 60000
      }
      {
        name: 'search'
        default: 'meteorjs'
      }
    ]
  }