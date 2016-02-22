
# Original Python:
#   from pyx import *
#
#   # colors and symbols to use (alternatingly)
#   colors = [color.rgb.red, color.rgb.green, color.rgb.blue, color.gray.black]
#   symbols = [graph.style._diamondsymbol, graph.style._trianglesymbol, graph.style._circlesymbol]
#                       
#   # create the graph styles to be used below
#   symbol = graph.style.symbol(symbol=attr.changelist(symbols),
#                               symbolattrs=[deco.stroked.clear,
#                                           attr.changelist([deco.filled([cc]) for cc in colors])])
#   line = graph.style.line(lineattrs=[attr.changelist(colors),
#                                   attr.changelist([style.linestyle.solid])])
#
#   g = graph.graphxy(width=8, x=graph.axis.linear(min=0, max=1))
#   g.plot([graph.data.function("y(x) = x**%d" % i, points=8) for i in range(1, 7)],
#       styles=[line, symbol])
#   g.writeEPSfile("usesymbol")
#   g.writePDFfile("usesymbol")
#   g.writeSVGfile("usesymbol")

using PyX

# colors and symbols to use (alternatingly)
colors = [color_rgb.red, color_rgb.green, color_rgb.blue, color_gray.black]
symbols = [graph_style._diamondsymbol, graph_style._trianglesymbol, graph_style._circlesymbol]
                       
# create the graph styles to be used below
symbol = graph_style.symbol(symbol=attr.changelist(symbols),
                            symbolattrs=[deco_stroked.clear,
                                         attr.changelist([deco.filled([cc]) for cc in colors])])
line = graph_style.line(lineattrs=[attr.changelist(colors),
                                   attr.changelist([style_linestyle.solid])])

g = graph.graphxy(width=8, x=graph_axis.linear(min=0, max=1))
plot(g, [graph_data_function("y(x) = x**$i", points=8) for i in 1:7],
        styles=[line, symbol])
writeEPSfile(g, "usesymbol")
writePDFfile(g, "usesymbol")

