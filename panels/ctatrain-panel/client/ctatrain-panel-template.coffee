root = exports ? this
  
Template.ctatrainpanel.helpers

  route: ->
    routeMap =
      'Brn': 'Brown'
    return routeMap[@rt]

  arrivalTime: ->
    return moment(@arrT, 'YYYYMMDD HH:mm:ss').fromNow()
