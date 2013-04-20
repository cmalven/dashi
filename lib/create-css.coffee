root = exports ? this

root.createCss = (val, property, unit = 'px') ->
  return "#{property}: #{val}#{unit};"