
module PyX

using PyCall
using LaTeXStrings

export canvas, path, deco, style, linewidth, linestyle, linejoin
export color, color_rgb, connector, text, box, graph, graph_axis, graph_data, graph_style
export graph_data_function
export epsfile, deformer, trafo
export plot, writeEPSfile, writePDFfile, writeSVGfile

canvas = pywrap(pyimport("pyx.canvas"))
path = pywrap(pyimport("pyx.path"))
deco = pywrap(pyimport("pyx.deco"))
style = pywrap(pyimport("pyx.style"))
linewidth = pywrap(style.linewidth)
linestyle = pywrap(style.linestyle)
linejoin = pywrap(style.linejoin)
color = pywrap(pyimport("pyx.color"))
color_rgb = pywrap(color.rgb)
connector = pywrap(pyimport("pyx.connector"))
text = pywrap(pyimport("pyx.text"))
box = pywrap(pyimport("pyx.box"))
graph = pywrap(pyimport("pyx.graph"))
graph_axis = pywrap(graph.axis)
graph_data = pywrap(graph.data)
graph_data_function = graph.data[:function]
graph_style = pywrap(graph.style)
epsfile = pywrap(pyimport("pyx.epsfile"))
deformer = pywrap(pyimport("pyx.deformer"))
trafo = pywrap(pyimport("pyx.trafo"))

function plot(g::PyObject, args...; kwargs...)
    return g[:plot](args...; kwargs...)
end

function writeEPSfile(g::PyObject, args...; kwargs...)
    return g[:writeEPSfile](args...; kwargs...)
end

function writePDFfile(g::PyObject, args...; kwargs...)
    return g[:writePDFfile](args...; kwargs...)
end

function writeSVGfile(g::PyObject, args...; kwargs...)
    return g[:writeSVGfile](args...; kwargs...)
end

# TODO:
# canvas: text(), stroke()
# path: append()

end # module PyX
