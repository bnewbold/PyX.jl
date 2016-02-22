
# Original Python:

#   from pyx import *

#   mypainter = graph.axis.painter.bar(nameattrs=[trafo.rotate(45),
#                                               text.halign.right],
#                                   innerticklength=0.1)
#   myaxis = graph.axis.bar(painter=mypainter)

#   g = graph.graphxy(width=8, x=myaxis)
#   g.plot(graph.data.file("minimal.dat", xname=1, y=2), [graph.style.bar()])
#   g.writeEPSfile("month")
#   g.writePDFfile("month")
#   g.writeSVGfile("month")

using PyX
mypainter = graph_axis_painter.bar(nameattrs=[trafo.rotate(45),
                                            text_halign.right],
                                innerticklength=0.1)
myaxis = graph_axis.bar(painter=mypainter)

g = graph.graphxy(width=8, x=myaxis)
plot(g, graph_data.file("examples/bargraphs/minimal.dat", xname=1, y=2),
        [graph_style.bar()])
writeEPSfile(g, "month")
writePDFfile(g, "month")
