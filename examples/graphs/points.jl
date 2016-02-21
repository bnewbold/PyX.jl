
# Original Python:
# suggested by Chris Spencer
# from pyx import *
# 
# g = graph.graphxy(width=8)
# # either provide lists of the individual coordinates
# g.plot(graph.data.values(x=list(range(10)), y=list(range(10))))
# # or provide one list containing the whole points
# g.plot(graph.data.points(list(zip(range(10), range(10))), x=1, y=2))
# g.writeEPSfile("points")
# g.writePDFfile("points")
# g.writeSVGfile("points")

using PyX

g = graph.graphxy(width=8)
plot(g, graph_data.values(x=1:10, y=1:10))
# XXX: x, y syntax in Python3 version only
# XXX: also other errors
#plot(g, graph_data.points([[i i] for i in 1:10], 1:10), x=1, y=2)
writeEPSfile(g, "points")
writePDFfile(g, "points")
