
# Original Python:

#   from pyx import *

#   g = graph.graphxy(width=8, x=graph.axis.nestedbar())
#   g.plot([graph.data.file("minimal.dat", xname="$0, 0", y=2),
#           graph.data.file("minimal.dat", xname="$0, 1", y=3)],
#       [graph.style.bar()])
#   g.writeEPSfile("compare")
#   g.writePDFfile("compare")
#   g.writeSVGfile("compare")

using PyX
using LaTeXStrings

g = graph.graphxy(width=8, x=graph_axis.nestedbar())
plot(g, [graph_data.file("examples/bargraphs/minimal.dat", xname=L"$0, 0", y=2),
      graph_data.file("examples/bargraphs/minimal.dat", xname=L"$0, 1", y=3)],
  [graph_style.bar()])
writeEPSfile(g, "compare")
writePDFfile(g, "compare")
