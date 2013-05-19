root = exports ? this

class root.BarChart extends DashiChart
  
  constructor: (@options) ->

    # Initial Update
    super(@options)

  _setup: =>
    @_setBars()
    @_setScale()

  _setBars: =>
    @bars = @svg.selectAll("rect")
      .data(@dataset)
      .enter()
      .append("rect")

  _setScale: =>
    @scaleY = d3.scale.linear()
      .domain([0, @max])
      .range([4, @h])
    
    @scaleX = d3.scale.ordinal()
      .domain(d3.range(@dataset.length))
      .rangeRoundBands([0, @w], 0.2)

  _update: =>
    @svg.selectAll("rect")
      .attr("x", (d, i) =>
        return @scaleX(i)
      )
      .attr("y", (d) =>
        return @h - @scaleY(d)
      )
      .attr("width", @scaleX.rangeBand())
      .attr("height", (d, i) =>
        return @scaleY(d)
      )

    @svg.selectAll("text")
      .text((d) ->
        return d
      )
      .attr("x", (d, i) =>
        return @scaleX(i) + @scaleX.rangeBand() / 2
      )
      .attr("y", (d) =>
        offset = if d is 0 then -7 else 18
        return @h - @scaleY(d) + offset
      )
      .attr("text-anchor", "middle")
