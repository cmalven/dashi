root = exports ? this
  
Template.ctatrainpanel.route = ->
  routeMap =
    'Brn': 'Brown'
  return routeMap[@rt]

Template.ctatrainpanel.arrivalTime = ->
  return moment(@arrT, 'YYYYMMDD HH:mm:ss').fromNow()
