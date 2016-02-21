
# Original Python:
# from pyx import *
# 
# g = graph.graphxy(width=8,
#                   x=graph.axis.linear(min=0, max=2),
#                   y=graph.axis.linear(min=0, max=2),
#                   key=graph.key.key(pos="br", dist=0.1))
# g.plot([graph.data.function("x(y)=y**4", title=r"$x = y^4$"),
#        graph.data.function("x(y)=y**2", title=r"$x = y^2$"),
#        graph.data.function("x(y)=y", title=r"$x = y$"),
#        graph.data.function("y(x)=x**2", title=r"$y = x^2$"),
#        graph.data.function("y(x)=x**4", title=r"$y = x^4$")],
#        [graph.style.line([color.gradient.Rainbow])])
# g.writeEPSfile("change")
# g.writePDFfile("change")
# g.writeSVGfile("change")

using PyX
using LaTeXStrings

g = graph.graphxy(width=8,
                  x=graph_axis.linear(min=0, max=2),
                  y=graph_axis.linear(min=0, max=2),
                  key=graph_key.key(pos="br", dist=0.1))
plot(g, [graph_data_function("x(y)=y**4", title=L"$x = y^4$"),
         graph_data_function("x(y)=y**2", title=L"$x = y^2$"),
         graph_data_function("x(y)=y", title=L"$x = y$"),
         graph_data_function("y(x)=x**2", title=L"$y = x^2$"),
         graph_data_function("y(x)=x**4", title=L"$y = x^4$")],
        [graph_style.line([color_gradient.Rainbow])])
writeEPSfile(g, "change")
writePDFfile(g, "change")
