root = exports ? this

root.gridUnits = {

  width: ->
    v = @updateVars()
    return floorToDecimals((v.ww - @totalSpacingX() - v.gm) / v.gx)

  height: ->
    v = @updateVars()
    return floorToDecimals((v.wh - @totalSpacingY() - v.gm) / v.gy)

  totalSpacingX: ->
    v = @updateVars()
    Session.get('grid_spacing') * (v.gx - 1)

  totalSpacingY: ->
    v = @updateVars()
    Session.get('grid_spacing') * (v.gy - 1)

  # Determines how many grid units are in a given width
  getUnitsForWidth: (widthInPx) ->
    v = @updateVars()
    unitWidth = v.gx + 1
    determinedUnitWidth = null
    while unitWidth--
      totalGutters = (unitWidth - 1) * Session.get('grid_spacing')
      thisUnitWidth = Math.round((widthInPx - totalGutters) / @width())
      determinedUnitWidth = unitWidth if thisUnitWidth is unitWidth
    return determinedUnitWidth

  # Determines how many grid units are in a given height
  getUnitsForHeight: (heightInPx) ->
    v = @updateVars()
    unitHeight = v.gy + 1
    determinedUnitHeight = null
    while unitHeight--
      totalGutters = (unitHeight - 1) * Session.get('grid_spacing')
      thisUnitHeight = Math.round((heightInPx - totalGutters) / @height())
      determinedUnitHeight = unitHeight if thisUnitHeight is unitHeight
    return determinedUnitHeight

  updateVars: ->
    return {
      gx: Session.get('grid_units_x')
      gy: Session.get('grid_units_y')
      gm: Session.get('grid_margin') * 2
      ww: Session.get('window_width')
      wh: Session.get('window_height')
    }
}