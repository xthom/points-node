
module.exports = class PointCollection

  constructor: (@points = []) ->
    @iterator = 0

  getAll: -> @points

  add: (point) ->
    @points.push point

  getPoint: (name) ->
    return point for point in @points when point.name is name

  exists: (point) ->
    return point in @points

  count: -> @points.length

