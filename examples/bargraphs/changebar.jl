
# Original Python:

#   from pyx import *

#   g = graph.graphxy(width=8, x=graph.axis.bar())
#   g.plot(graph.data.file("minimal.dat", xname=0, y=2), [graph.style.changebar()])
#   g.writeEPSfile("changebar")
#   g.writePDFfile("changebar")
#   g.writeSVGfile("changebar")

using PyX

g = graph.graphxy(width=8, x=graph_axis.bar())
plot(g, graph_data.file("examples/bargraphs/minimal.dat", xname=0, y=2), [graph_style.changebar()])
writeEPSfile(g, "changebar")
writePDFfile(g, "changebar")
