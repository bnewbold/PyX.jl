
println("Importing libs...")
include("../src/PyX.jl")
using PyX
using LaTeXStrings
using PyCall
using Base.Test

##### Helpers
println("Testing helpers...")
include("test_pyrecwrap.jl")

##### Setup Common Objects
println("Creating test objects...")
include("test_objects.jl")

##### MIME and Ghostscript output
println("MIME and Ghostscript tests...")

include("test_gs.jl")
include("test_mime.jl")

##### Run all the examples that don't have data files

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
include("../examples/splitgraphs/splitatvalue.jl")

# All bargraphs have data files

include("../examples/graphs/axis.jl")
include("../examples/graphs/change.jl")
include("../examples/graphs/function.jl")
include("../examples/graphs/lissajous.jl")
include("../examples/graphs/points.jl")

include("../examples/graphstyles/histogram.jl")
include("../examples/graphstyles/usesymbol.jl")
include("../examples/graphstyles/density.jl")

println("3D Graphs...")
include("../examples/3dgraphs/bar.jl")

