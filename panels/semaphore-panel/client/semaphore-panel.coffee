root = exports ? this

class root.SemaphorePanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'semaphore'

    super(@panel)

  _update: =>
    that = @
    Meteor.call 'fetchSemaphore', @panel.project_hash_id, @panel.branch_id, (error, result) ->
      console.log 'semaphore-data', result
      update Panels, that.panel._id,
        'project_name': result.project_name
        'branch_name': result.branch_name
        'finished_at': result.finished_at
        'build_number': result.build_number
        'status': if result.result is 'passed' then true else false