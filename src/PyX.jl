
module PyX

using PyCall
using LaTeXStrings

export canvas, path, deco, deco_stroked, deco_filled
export connector, text, text_halign, text_valign, box
export style, style_linewidth, style_linestyle, style_linejoin, style_linecap
export color, color_rgb, color_gray, color_gradient, color_rgbgradient
export graph, graph_axis, graph_axis_painter, graph_data, graph_style, graph_style_symbol, graph_key
export graph_graphxyz, graph_data_function
export epsfile, deformer, trafo, attr, metapost_path
export plot, stroke
export writeEPSfile, writePDFfile, writeSVGfile
export pyx_fill, pyx_append, pyx_insert, pyx_text

canvas = pywrap(pyimport("pyx.canvas"))
path = pywrap(pyimport("pyx.path"))
deco = pywrap(pyimport("pyx.deco"))
deco_stroked = pywrap(deco.stroked)
deco_filled = pywrap(deco.filled)
style = pywrap(pyimport("pyx.style"))
style_linewidth = pywrap(style.linewidth)
style_linestyle = pywrap(style.linestyle)
style_linejoin = pywrap(style.linejoin)
style_linecap = pywrap(style.linecap)
color = pywrap(pyimport("pyx.color"))
color_rgb = pywrap(color.rgb)
color_gray = pywrap(color.gray)
color_gradient = pywrap(color.gradient)
color_rgbgradient = pywrap(color.rgbgradient)
connector = pywrap(pyimport("pyx.connector"))
text = pywrap(pyimport("pyx.text"))
text_halign = pywrap(text.halign)
text_valign = pywrap(text.valign)
box = pywrap(pyimport("pyx.box"))
graph = pywrap(pyimport("pyx.graph"))
graph_axis = pywrap(graph.axis)
graph_axis_painter = pywrap(graph_axis.painter)
graph_data = pywrap(graph.data)
graph_data_function = graph.data[:function]
graph_key = pywrap(graph.key)
graph_style = pywrap(graph.style)
graph_style_symbol = pywrap(graph_style.symbol)
graph_graphxyz = pywrap(graph.graphxyz)
epsfile = pywrap(pyimport("pyx.epsfile"))
deformer = pywrap(pyimport("pyx.deformer"))
trafo = pywrap(pyimport("pyx.trafo"))
attr = pywrap(pyimport("pyx.attr"))
metapost_path = pywrap(pyimport("pyx.metapost.path"))

function plot(g::PyObject, args...; kwargs...)
    # g should be Graph object
    return g[:plot](args...; kwargs...)
end

function stroke(c::PyObject, args...; kwargs...)
    # c should be Canvas object
    return c[:stroke](args...; kwargs...)
end

function pyx_fill(c::PyObject, args...; kwargs...)
    # c should be Canvas object
    return c[:fill](args...; kwargs...)
end

function pyx_text(c::PyObject, args...; kwargs...)
    # c should be Canvas object
    return c[:text](args...; kwargs...)
end

function pyx_append(p::PyObject, args...; kwargs...)
    # p should be Path object
    return p[:append](args...; kwargs...)
end

function pyx_insert(c::PyObject, args...; kwargs...)
    # c should be Canvas object
    return c[:insert](args...; kwargs...)
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

end # module PyX
