root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'SemaphorePanel'
  panel_display_name: 'Semaphore'
  params: {
    required: [
      
    ]
    optional: [
      {
        name: 'update_interval'
        default: 2
      }
    ]
  }
