root = exports ? this

Template.panel.dynamicTemplate = ->
  panelName = @className.toLowerCase()
  return Template[panelName](@)

Template.panel.created = ->
  opts = this.data
  new root[opts.className](opts)

Template.panel.preserve(['.panel'])