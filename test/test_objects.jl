
# PyxCanvas
c = canvas.canvas()
stroke(c, path.curve(0, 0, 0, 4, 2, 4, 3, 3),
        [style_linewidth.THICK, style_linestyle.dashed, color_rgb.blue,
        deco.earrow([deco.stroked([color_rgb.red, style_linejoin.round]),
        deco.filled([color_rgb.green])], size=1)])

@test typeof(c) == PyxCanvas

# graph.graphxy
g = graph.graphxy(width=8,
                  x=graph_axis.log(min=1e-1, max=1e4, title=L"$x$-axis"),
                  y=graph_axis.lin(max=5, title=L"$y$-axis"))
plot(g, graph_data_function("y(x)=tan(log(1/x))**2"))

@test typeof(g) == PyxCanvas

# graph.graphxyz
g3d = graph.graphxyz(0, 0, size=5,
                     x=graph_axis.bar(),
                     y=graph_axis.bar(),
                     z=nothing,
                     z2=graph_axis.lin())
plot(g3d, graph_data.data(graph_data.points([[1  1   1.4];
                                             [1  2   1.8];
                                             [2  1  -0.5];
                                             [2  2   0.9]]), xname=1, yname=2, z2=3),
         [graph_style.barpos(fromvalue=0, frompathattrs=nothing),
          graph_style.bar(barattrs=[style_linejoin.bevel])])

@test typeof(g3d) == PyxCanvas
