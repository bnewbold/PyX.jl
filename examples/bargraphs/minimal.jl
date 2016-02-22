
# Original Python:

#   from pyx import *

#   g = graph.graphxy(width=8, x=graph.axis.bar())
#   g.plot(graph.data.file("minimal.dat", xname=0, y=2), [graph.style.bar()])
#   g.writeEPSfile("minimal")
#   g.writePDFfile("minimal")
#   g.writeSVGfile("minimal")

g = graph.graphxy(width=8, x=graph_axis.bar())
plot(g, graph_data.file("examples/bargraphs/minimal.dat", xname=0, y=2), [graph_style.bar()])
writeEPSfile(g, "bar_minimal")
writePDFfile(g, "bar_minimal")
