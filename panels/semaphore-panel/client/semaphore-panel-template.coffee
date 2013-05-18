root = exports ? this
  
Template.semaphorepanel.helpers
  
  build_status: ->
    if @status then 'Passed' else 'Failed'
    
  formatted_finished_at: ->
    moment(@finished_at).format('h:mm a')
