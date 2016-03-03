
module PyX

####### Required and over-written
using PyCall
import PyCall: pycall
import Base: convert, ==, isequal, hash, writemime, getindex, setindex!, haskey, keys, show, mimewritable


# LaTeXStrings is strongly recommended but not required

####### Types
export PyxCanvas
# Wrapper around PyX PyxCanvas, supporting graphics I/O and pretty display
# Based on PyPlot's Figure type
type PyxCanvas
    o::PyObject
end

PyObject(f::PyxCanvas) = f.o
convert(::Type{PyxCanvas}, o::PyObject) = PyxCanvas(o)
==(f::PyxCanvas, g::PyxCanvas) = f.o == g.o
==(f::PyxCanvas, g::PyObject) = f.o == g
==(f::PyObject, g::PyxCanvas) = f == g.o
hash(f::PyxCanvas) = hash(f.o)
pycall(f::PyxCanvas, args...; kws...) = pycall(f.o, args...; kws...)
Base.call(f::PyxCanvas, args...; kws...) = pycall(f.o, PyAny, args...; kws...)
Base.Docs.doc(f::PyxCanvas) = Base.Docs.doc(f.o)
getindex(f::PyxCanvas, x) = getindex(f.o, x)
setindex!(f::PyxCanvas, v, x) = setindex!(f.o, v, x)
haskey(f::PyxCanvas, x) = haskey(f.o, x)
keys(f::PyxCanvas) = keys(f.o)

mimewritable(::MIME"application/eps", c::PyxCanvas) = !isempty(c.o[:items])
mimewritable(::MIME"image/eps", c::PyxCanvas) = !isempty(c.o[:items])
mimewritable(::MIME"application/pdf", c::PyxCanvas) = !isempty(c.o[:items])
mimewritable(::MIME"application/postscript", c::PyxCanvas) = !isempty(c.o[:items])
mimewritable(::MIME"image/png", c::PyxCanvas) = !isempty(c.o[:items])
mimewritable(::MIME"image/jpeg", c::PyxCanvas) = !isempty(c.o[:items])

writemime(io::IO, ::MIME"application/pdf", c::PyxCanvas) = writePDFfile(c, io)
writemime(io::IO, ::MIME"application/eps", c::PyxCanvas) = writeEPSfile(c, io)
writemime(io::IO, ::MIME"image/eps", c::PyxCanvas) = writeEPSfile(c, io)
writemime(io::IO, ::MIME"application/postscript", c::PyxCanvas) = writePSfile(c, io)
writemime(io::IO, ::MIME"image/png", c::PyxCanvas) = write(io, pipeGS(c, "png16m"))
writemime(io::IO, ::MIME"image/jpeg", c::PyxCanvas) = write(io, pipeGS(c, "jpeg"))

####### Exports
export canvas, path, deco, deco_stroked, deco_filled
export connector, text, text_halign, text_valign, box
export style, style_linewidth, style_linestyle, style_linejoin, style_linecap
export color, color_rgb, color_gray, color_gradient, color_rgbgradient
export graph, graph_axis, graph_axis_painter, graph_data, graph_style, graph_style_symbol, graph_key
export graph_graphxyz, graph_data_function
export epsfile, deformer, trafo, attr, metapost_path
export plot, stroke
export writeEPSfile, writePDFfile, writePSfile, writeGSfile, pipeGS
export pyx_fill, pyx_append, pyx_insert, pyx_text
# See also Python3 section at end

####### Create virtual (pywrap) Julia modules for PyX python sub-modules
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

####### Wrapper Functions
plot(g::PyObject, a...; k...) = g[:plot](a...; k...)
plot(g::PyxCanvas, a...; k...) = g[:plot](a...; k...)
stroke(c::PyxCanvas, a...; k...) = c[:stroke](a...; k...)
pyx_fill(c::PyxCanvas, a...; k...) = c[:fill](a...; k...)
pyx_text(c::PyxCanvas, a...; k...) = c[:text](a...; k...)
pyx_insert(c::PyxCanvas, a...; k...) = c[:insert](a...; k...)

# p should be Path object
pyx_append(p::PyObject, a...; k...) = p[:append](a...; k...)

writeEPSfile(g::PyObject, a...; k...) = g[:writeEPSfile](a...; k...)
writeEPSfile(c::PyxCanvas, a...; k...) = c[:writeEPSfile](a...; k...)
writePDFfile(g::PyObject, a...; k...) = g[:writePDFfile](a...; k...)
writePDFfile(c::PyxCanvas, a...; k...) = c[:writePDFfile](a...; k...)
writePSfile(g::PyObject, a...; k...) = g[:writePSfile](a...; k...)
writePSfile(c::PyxCanvas, a...; k...) = c[:writePSfile](a...; k...)
writeGSfile(g::PyObject, filename::AbstractString, a...; k...) = g[:writeGSfile](filename, a...; k...)
writeGSfile(c::PyxCanvas, filename::AbstractString, a...; k...) = c[:writeGSfile](filename, a...; k...)

# Some newer features only in recent (Python3) versions of PyX
if PyCall.pyversion > v"3"
    export writeSVGfile
    writeSVGfile(g::PyObject, a...; k...) = g[:writeSVGfile](a...; k...)
    writeSVGfile(c::PyxCanvas, a...; k...) = c[:writeSVGfile](a...; k...)
    mimewritable(::MIME"image/svg+xml", c::PyxCanvas) = !isempty(c.o[:items])
    writemime(io::IO, ::MIME"image/svg+xml", c::PyxCanvas) = writeSVGfile(c, io)
end

##### Actual Meaty Functions
function __init__()
    pytype_mapping(canvas.canvas, PyxCanvas)
end

function pipeGS(g::PyxCanvas, device="png16m", args...; kwargs...)
    f = g[:pipeGS](args...; device=device, kwargs...)
    d = f[:read]()
    f[:close]()
    return d
end

end # module PyX
