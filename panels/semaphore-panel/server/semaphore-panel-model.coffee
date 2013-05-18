root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'SemaphorePanel'
  panel_display_name: 'Semaphore'
  params: {
    required: [
      {
        name: 'project_hash_id'
      }
      {
        name: 'branch_id'
      }
    ]
    optional: [
      {
        name: 'update_interval'
        default: 220000
      }
    ]
  }
