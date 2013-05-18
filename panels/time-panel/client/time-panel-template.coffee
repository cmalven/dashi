root = exports ? this

totalDegrees = 360
totalMinutes = 60
totalHours = 12

Template.timepanel.helpers

  time: ->
    "#{@hour}:#{@minutes}"

  minute_rotation_css: ->
    minutes = @minutes
    degrees = (minutes / totalMinutes) * totalDegrees
    return _formatRotation(degrees)

  hour_rotation_css: ->
    hour = @hour
    degrees = (hour / totalHours) * totalDegrees
    return _formatRotation(degrees)


_formatRotation = (degrees) ->
  "-webkit-transform: rotateZ(#{degrees}deg);"