root = exports ? this

class root.BarChart extends DashiChart
  
  constructor: (@options) ->
    
    # Setup Axis

    #formatAsPercentage = d3.format(".1%")

    #@xAxis = d3.svg.axis()
    #  .scale(@scaleX)
    #  .orient('bottom')
    #  .ticks(5)
    #  .tickFormat(formatAsPercentage)

    #@yAxis = d3.svg.axis()
    #  .scale(@scaleY)
    #  .orient('left')
    #  .ticks(5)
    #  .tickFormat(formatAsPercentage)
    
    # Text

    # Create Axis

    # @svg.append("g")
    #   .attr("class", "axis")
    #   .attr("transform", "translate(0," + (@h - @padding) + ")")
    #   .call(@xAxis)
    # 
    # @svg.append("g")
    #   .attr("class", "axis")
    #   .attr("transform", "translate(" + @padding + ",0)")
    #   .call(@yAxis)

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
