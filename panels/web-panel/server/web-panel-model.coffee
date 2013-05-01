root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'WebPanel'
  panel_display_name: 'Web Snippet'
  params: {
    required: [
      {
        name: 'url'
      }
    ]
    optional: [
      {
        name: 'update_interval'
        default: 20000
      }
    ]
  }
