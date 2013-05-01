root = exports ? this
root.panelOptionsArray or= []

panelOptionsArray.push
  panelName: 'CtaTrainPanel'
  panel_display_name: 'CTA Train'
  params: {
    required: [
      {
        name: 'api_key'
      }
    ]
    optional: [
      {
        name: 'station_id'
        default: '40710'
      }
      {
        name: 'update_interval'
        default: 220000
      }
    ]
  }
