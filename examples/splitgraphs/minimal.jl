# Original Python:
#   from pyx import *

#   g = graph.graphxy(width=8, x=graph.axis.split())
#   g.plot(graph.data.points([((0, 0.1), 0.1),
#                           ((0, 0.5), 0.2),
#                           ((0, 0.9), 0.3),
#                           ((1, 101), 0.7),
#                           ((1, 105), 0.8),
#                           ((1, 109), 0.9)], x=1, y=2))
#   g.writeEPSfile("minimal")
#   g.writePDFfile("minimal")
#   g.writeSVGfile("minimal")

using PyX

g = graph.graphxy(width=8, x=graph_axis.split())
plot(g, graph_data.points([((0, 0.1), 0.1),
                           ((0, 0.5), 0.2),
                           ((0, 0.9), 0.3),
                           ((1, 101), 0.7),
                           ((1, 105), 0.8),
                           ((1, 109), 0.9)], x=1, y=2))
writeEPSfile(g, "minimal")
writePDFfile(g, "minimal")
