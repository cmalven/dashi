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

  updateVars: ->
    return {
      gx: Session.get('grid_units_x')
      gy: Session.get('grid_units_y')
      gm: Session.get('grid_margin') * 2
      ww: Session.get('window_width')
      wh: Session.get('window_height')
    }
}