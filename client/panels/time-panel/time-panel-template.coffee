root = exports ? this

totalDegrees = 360
totalMinutes = 60
totalHours = 12

Template.timepanel.minute_rotation_css = ->
  minutes = @minutes
  degrees = (minutes / totalMinutes) * totalDegrees
  return _formatRotation(degrees)

Template.timepanel.hour_rotation_css = ->
  hour = @hour
  degrees = (hour / totalHours) * totalDegrees
  return _formatRotation(degrees)

_formatRotation = (degrees) ->
  "-webkit-transform: rotateZ(#{degrees}deg);"