
Point = require './point'
Graph = require './graph'
Trace = require './trace'
PointCollection = require './pointCollection'

points = []

points.push a = new Point "a", 1, 5
points.push b = new Point "b", 4, 4
points.push c = new Point "c", 5, 1
points.push d = new Point "d", -1, -5
points.push e = new Point "e", 7, 8

graph = new Graph points

a.addTarget b
a.addTarget c
a.addTarget d

b.addTarget a
b.addTarget c
b.addTarget e

c.addTarget d

d.addTarget e

try
  
  traces = graph.getTrace a, e

  for i, trace of traces
    console.log "Trace #{i}:"
    console.log " - points: #{trace.getNamedTrace().join " -> "}"
    console.log " - distance: #{trace.getDistance()}"

catch e
  console.log e

