
# Original Python:
#   from pyx import *
#
#   g = graph.graphxyz(0, 0, size=5, x=graph.axis.bar(), y=graph.axis.bar(), z=nothing, z2=graph.axis.lin())
#   g.plot(graph.data.data(graph.data.points([[1, 1, 1.4], [1, 2, 1.8], [2, 1, -0.5], [2, 2, 0.9]]), xname=1, yname=2, z2=3),
#       [graph.style.barpos(fromvalue=0, frompathattrs=nothing), graph.style.bar(barattrs=[style.linejoin.bevel])])
#   g.writeEPSfile("bar")
#   g.writePDFfile("bar")
#   g.writeSVGfile("bar")


using PyX

g = graph.graphxyz(0, 0, size=5,
                   x=graph_axis.bar(),
                   y=graph_axis.bar(),
                   z=nothing,
                   z2=graph_axis.lin())
plot(g, graph_data.data(graph_data.points([[1  1   1.4];
                                           [1  2   1.8];
                                           [2  1  -0.5];
                                           [2  2   0.9]]), xname=1, yname=2, z2=3),
       [graph_style.barpos(fromvalue=0, frompathattrs=nothing),
        graph_style.bar(barattrs=[style_linejoin.bevel])])
writeEPSfile(g, "bar")
writePDFfile(g, "bar")

