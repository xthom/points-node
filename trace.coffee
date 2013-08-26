
module.exports = class Trace

  constructor: (@points) ->

  getNamedTrace: ->
    point.getName() for point in @points

  getDistance: ->
    distance = 0
    for point in @points
      unless prev
        prev = point
        continue

      [x1, y1] = prev.getCoords()
      [x2, y2] = point.getCoords()
      num = Math.sqrt Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2)
      distance += Math.round(num * 100) / 100
      prev = point

    distance


