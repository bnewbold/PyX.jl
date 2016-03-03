
println("Importing libs...")
include("../src/PyX.jl")
using PyX
using LaTeXStrings
using Base.Test

##### Run all the examples

println("Drawing...")
include("../examples/drawing/arrow.jl")
#include("../examples/drawing/metapost.jl") # Python3 only?
include("../examples/drawing/pathitem.jl")
include("../examples/drawing/path.jl")
include("../examples/drawing/strokefill.jl")
include("../examples/drawing/style.jl")

include("../examples/drawing2d/clipping.jl")
include("../examples/drawing2d/ellipse.jl")
include("../examples/drawing2d/insert.jl")
include("../examples/drawing2d/parallel.jl")
include("../examples/drawing2d/smoothed.jl")

println("Graphs...")
include("../examples/splitgraphs/minimal.jl")
include("../examples/splitgraphs/splitatvalue.jl")

include("../examples/bargraphs/changebar.jl")
include("../examples/bargraphs/compare.jl")
include("../examples/bargraphs/errors.jl")
include("../examples/bargraphs/fromvalue.jl")
include("../examples/bargraphs/minimal.jl")
include("../examples/bargraphs/month.jl")
include("../examples/bargraphs/stacked.jl")

include("../examples/graphs/axis.jl")
include("../examples/graphs/change.jl")
include("../examples/graphs/function.jl")
include("../examples/graphs/lissajous.jl")
include("../examples/graphs/join.jl")
include("../examples/graphs/minimal.jl")
include("../examples/graphs/points.jl")

include("../examples/graphstyles/histogram.jl")
include("../examples/graphstyles/usesymbol.jl")
include("../examples/graphstyles/errorbar.jl")
include("../examples/graphstyles/density.jl")

println("3D Graphs...")
include("../examples/3dgraphs/bar.jl")
include("../examples/3dgraphs/color.jl")
include("../examples/3dgraphs/grid.jl")
include("../examples/3dgraphs/surface.jl")

