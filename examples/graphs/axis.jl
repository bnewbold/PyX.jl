
# Original Python:
#from pyx import *
#
#g = graph.graphxy(width=8,
#                  x=graph.axis.log(min=1e-1, max=1e4, title=r"$x$-axis"),
#                  y=graph.axis.lin(max=5, title=r"$y$-axis"))
#g.plot(graph.data.function("y(x)=tan(log(1/x))**2"))
#g.writeEPSfile("axis")
#g.writePDFfile("axis")
#g.writeSVGfile("axis")

using PyX
using LaTeXStrings

g = graph.graphxy(width=8,
                  x=graph_axis.log(min=1e-1, max=1e4, title=L"$x$-axis"),
                  y=graph_axis.lin(max=5, title=L"$y$-axis"))
plot(g, graph_data_function("y(x)=tan(log(1/x))**2"))
writeEPSfile(g, "axis")
writePDFfile(g, "axis")
