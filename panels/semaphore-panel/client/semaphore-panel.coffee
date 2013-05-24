root = exports ? this

class root.SemaphorePanel extends Panel
  constructor: (@panel) ->
    # Default settings
    @settings =
      panelCssClass: 'semaphore'

    super(@panel)

  _update: =>
    that = @
    Meteor.call 'fetchSemaphore', @panel.project_hash_id, (error, result) ->
      console.log 'semaphore-data', result

      # Determine the most recently updated project and branch
      newestProject = _.max result, (project) ->
        return moment(project.updated_at)?.diff moment()
      newestBranch = _.max newestProject.branches, (branch) ->
        return moment(branch.finished_at)?.diff moment()

      update Panels, that.panel._id,
        'project_name': newestProject.name
        'branch_name': newestBranch.branch_name
        'finished_at': newestBranch.finished_at
        'build_number': newestBranch.build_number
        'commit_author_email': newestBranch.commit.author_email
        'commit_author_name': newestBranch.commit.author_name
        'status': if newestBranch.result is 'passed' then true else false