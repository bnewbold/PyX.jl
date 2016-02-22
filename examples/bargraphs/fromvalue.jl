
# Original Python:

#   from pyx import *

#   g = graph.graphxy(width=8, x=graph.axis.bar())
#   g.plot(graph.data.file("minimal.dat", xname=0, y=2),
#       [graph.style.barpos(fromvalue=0), graph.style.bar()])
#   g.writeEPSfile("fromvalue")
#   g.writePDFfile("fromvalue")
#   g.writeSVGfile("fromvalue")

using PyX

g = graph.graphxy(width=8, x=graph_axis.bar())
plot(g, graph_data.file("examples/bargraphs/minimal.dat", xname=0, y=2),
    [graph_style.barpos(fromvalue=0), graph_style.bar()])
writeEPSfile(g, "fromvalue")
writePDFfile(g, "fromvalue")
