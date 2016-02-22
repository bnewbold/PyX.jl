
# Original Python:
#   from pyx import *
#
#   g = graph.graphxy(width=8)
#   g.plot(graph.data.file("errorbar.dat", x=1, y=2, dy=3),
#       [graph.style.symbol(), graph.style.errorbar()])
#   g.writeEPSfile("errorbar")
#   g.writePDFfile("errorbar")
#   g.writeSVGfile("errorbar")

using PyX

g = graph.graphxy(width=8)
plot(g, graph_data.file("examples/graphstyles/errorbar.dat", x=1, y=2, dy=3),
        [graph_style.symbol(), graph_style.errorbar()])
writeEPSfile(g, "errorbar")
writePDFfile(g, "errorbar")

