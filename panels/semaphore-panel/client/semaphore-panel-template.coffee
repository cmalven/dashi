root = exports ? this
  
Template.semaphorepanel.helpers
  
  build_status: ->
    if @status then 'Passed' else 'Failed'

  build_status_class: ->
    if @status then 'is-passed' else 'is-failed'
    
  formatted_finished_at: ->
    moment(@finished_at).fromNow()