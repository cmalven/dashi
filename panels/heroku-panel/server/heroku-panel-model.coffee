root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'HerokuPanel'
  panel_display_name: 'Heroku Releases'
  params: {
    required: [
      {
        name: 'app_name'
      }
    ]
    optional: [
      
      {
        name: 'update_interval'
        default: 480
      }
    ]
  }
