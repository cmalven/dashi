root = exports ? this

Template.herokupanel.helpers
  
  formatted_app_name: ->
    return slang.capitalizeWords(@app_name).replace /[_-]/, ' '

Template.herokupanel.rendered = ->
  numWeeks = 8
  weeklyData = []
  for i in [1..numWeeks]
    weeklyData.push 0
  for release in @data.releases
    # Make sure the release is actually a deploy and not a change to the app
    unless release.descr.indexOf("Deploy") is -1
      releaseDate = release.created_at
      weeksAgo = Math.abs(moment(releaseDate).diff moment(), 'weeks')
      # Add to array in reverse order (oldest to newest)
      weeklyData[weeklyData.length - 1 - weeksAgo]++

  chart = new BarChart
    'dataset': weeklyData
    'el':      @find '.heroku-panel__release_chart'