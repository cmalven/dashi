root = exports ? this

Template.herokupanel.helpers
  
  formatted_app_name: ->
    return slang.capitalizeWords(@app_name).replace /[_-]/, ' '

Template.herokupanel.created = ->

  Panels.find(@.data._id).observeChanges

    added: createChart
    changed: createChart

createChart = (id, fields) =>
  el = @find '.heroku-panel__release_chart'
  $(el).empty()

  numWeeks = 8
  weeklyData = []
  for i in [1..numWeeks]
    weeklyData.push 0
  
  # Release data might not be available yet
  return unless fields.releases?

  for release in fields.releases
    # Make sure the release is actually a deploy and not a change to the app
    unless release.descr.indexOf("Deploy") is -1
      releaseDate = release.created_at
      weeksAgo = Math.abs(moment(releaseDate).diff moment(), 'weeks')
      # Add to array in reverse order (oldest to newest)
      weeklyData[weeklyData.length - 1 - weeksAgo]++

  chart = new BarChart
    'dataset': weeklyData
    'el':      el