
# Original Python:
# from pyx import *
#
# g = graph.graphxyz(size=4, x2=None, y2=None)
# g.plot(graph.data.file("surface.dat", x=1, y=2, z=3), [graph.style.surface()])
# g.writeEPSfile("surface")
# g.writePDFfile("surface")
# g.writeSVGfile("surface")

using PyX

g = graph.graphxyz(size=4, x2=nothing, y2=nothing)
plot(g, graph_data.file("examples/3dgraphs/surface.dat", x=1, y=2, z=3),
        [graph_style.surface()])
writeEPSfile(g, "surface")
writePDFfile(g, "surface")
