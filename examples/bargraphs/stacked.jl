
# Original Python:

#   from pyx import *

#   g = graph.graphxy(width=14, height=6, x=graph.axis.bar())
#   g.plot(graph.data.file("minimal.dat", xname=0, y=2, stack=3),
#       [graph.style.bar(),
#           graph.style.text("y"),
#           graph.style.stackedbarpos("stack"),
#           graph.style.bar([color.rgb.green]),
#           graph.style.text("stack")])
#   g.writeEPSfile("stacked")
#   g.writePDFfile("stacked")
#   g.writeSVGfile("stacked")

using PyX

g = graph.graphxy(width=14, height=6, x=graph_axis.bar())
plot(g, graph_data.file("examples/bargraphs/minimal.dat", xname=0, y=2, stack=3),
        [graph_style.bar(),
         graph_style.text("y"),
         graph_style.stackedbarpos("stack"),
         graph_style.bar([color_rgb.green]),
         graph_style.text("stack")])
writeEPSfile(g, "stacked")
writePDFfile(g, "stacked")
