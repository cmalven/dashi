root = exports ? this

class root.Panel
  constructor: (@label, @unitSize, @updateInterval) ->
    console.log "New Panel #{label}"