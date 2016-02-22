
# Original Python:
#   from pyx import *
#
#   g = graph.graphxyz(size=4, z=graph.axis.lin(min=0.001))
#   g.plot(graph.data.file("grid.dat", x=1, y=2, z=3), [graph.style.grid()])
#   g.writeEPSfile("grid")
#   g.writePDFfile("grid")      
#   g.writeSVGfile("grid")      

using PyX

g = graph.graphxyz(size=4, z=graph_axis.lin(min=0.001))
plot(g, graph_data.file("examples/3dgraphs/grid.dat", x=1, y=2, z=3),
        [graph_style.grid()])
writeEPSfile(g, "grid")
writePDFfile(g, "grid")

