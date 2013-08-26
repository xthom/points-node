
PointCollection = require "./pointCollection"

module.exports = class Point

  constructor: (@name, @x, @y) ->
    @targets = new PointCollection

  getName: -> @name

  getCoords: -> [@x, @y]

  addTarget: (point) ->
    @targets.add point unless @targets.exists point

  getTargets: -> @targets