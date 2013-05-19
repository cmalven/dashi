root = exports ? this

class root.DashiChart
  constructor: (@options) ->

    # Set Defaults

    @dataset = @options.dataset
    @el = @options.el

    @w = $(@el).width()
    @h = $(@el).height()
    @min = d3.min @dataset
    @max = d3.max @dataset

    @_addSvg()
    @_addText()
    @_setup()
    @_update()

  _addSvg: =>
    @svg = d3.select(@el)
      .append("svg")
      .attr('width', @w)
      .attr('height', @h)

  _addText: =>
    @svg.selectAll("text")
       .data(@dataset)
       .enter()
       .append("text")