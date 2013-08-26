
PointsCollection = require './pointCollection'
Trace = require './trace'

underscore = require 'underscore'

module.exports = class Graph

  constructor: (points = []) ->
    @points = new PointsCollection points

  addPoint: (point) ->
    @points.add point unless @points.exists point

  getTrace: (pointFrom, pointTo) ->
    traces = []

    @_addPointToTrace traces, [], pointFrom, pointTo

    traces

  _addPointToTrace: (traces, trace, point, to) ->
    unless @points.exists point
      throw new Error """Point "#{point.getName?()}" is not assigned with the graph"""

    if point in trace
      return
    else 
      trace.push point
      return traces.push new Trace trace if point is to

    return if point.getTargets().count() is 0

    for target in point.getTargets().getAll()
      @_addPointToTrace traces, underscore.clone(trace), target, to

    return

