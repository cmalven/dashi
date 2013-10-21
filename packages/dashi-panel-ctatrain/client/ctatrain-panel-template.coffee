root = exports ? this
  
Template.ctatrainpanel.helpers
  
  route: ->
    return _convert_route @rt

  arrivalTime: ->
    time = moment(@arrT, 'YYYYMMDD HH:mm:ss').fromNow(true)
    return time.replace /minute[s]+/, '<em>min</em>'

  route_class: ->
    route = _convert_route @rt
    return 'is-' + slang.dasherize route

  old_class: ->
    return 'is-old' if moment(@arrT, 'YYYYMMDD HH:mm:ss').diff(moment()) < 0


_convert_route = (route) ->
  routeMap =
    'Red':  'Red'
    'Blue': 'Blue'
    'Brn':  'Brown'
    'G':    'Green'
    'Org':  'Orange'
    'P':    'Purple'
    'Pink': 'Pink'
    'Y':    'Yellow'
  return routeMap[route]