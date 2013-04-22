root = exports ? this

root.floorToDecimals = (number) ->
  return Math.floor(number * 10000) / 10000