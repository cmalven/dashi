root = exports ? this

Template.herokupanel.helpers
  
  formatted_app_name: ->
    return slang.capitalizeWords(@app_name).replace /[_-]/, ' '

Template.herokupanel.rendered = ->
  numWeeks = 8
  weeklyData = []
  for i in [1..numWeeks]
    weeklyData.push 0
  releases = _.pluck @data.releases, 'created_at'
  for releaseDate in releases
    weeksAgo = Math.abs(moment(releaseDate).diff moment(), 'weeks')
    # Add to array in reverse order (oldest to newest)
    weeklyData[weeklyData.length - 1 - weeksAgo]++

  chart = new BarChart
    'dataset': weeklyData
    'el':      @find '.heroku-panel__release_chart'