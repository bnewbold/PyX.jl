
# This file contains a recursive version of the pywrap() function from PyCall:
# it will generate nested Julia Modules for nested Python modules.
# This extends to recursive or infinitely looping modules. For example, the
# Python "os" module goes infinitely deep:
#
#   os.path.genericpath.os.path.genericpath.os.path.genericpath.os.path...
#
# It was created for PyX.jl because PyX has deeply nested modules (eg,
# pyx.graph.graphxy), which are not handled by the generic pywrap() from
# PyCall.

_pyrecwrap_cache = Dict{PyObject,Module}()
_pyx_module_skiplist = Set{ASCIIString}(["math", "os", "sys", "ast", "bytearray", "random", "errno",
    "shutil", "zlib", "copy", "base64", "array", "importlib", "glob", "email", "xml",
    "binascii", "encodings", "io", "tarfile", "threading", "itertools", "logging", "collections"])

function pyrecwrap(o::PyObject, mname::Symbol=:__anon__; skiplist=_pyx_module_skiplist)
    members = convert(Vector{Tuple{AbstractString,PyObject}},
                      pycall(PyCall.inspect["getmembers"], PyObject, o))
    if PyCall.pyversion >= v"3"
        # Blacklist the "inspect" module under Python3; fail if called on it, and filter it
        # out of recursive imports.
        # See also: https://github.com/stevengj/PyCall.jl/issues/252
        if o == PyCall.inspect
            error("Wrapping the 'inspect' module under Python3 causes a hang")
        end
        filter!(m -> !(m[1] == PyCall.inspect), members)
    end
    filter!(m -> !(m[1] in PyCall.reserved), members)
    filter!(m -> !(m[1] in skiplist), members)
    m = Module(mname, false)
    # Preload module cache with this (so far empty) module
    _pyrecwrap_cache[o] = m
    consts = Expr[]
    for (ms, mo) in members     # ms is Symbol, mo is PyObject)
        if pyisinstance(mo, PyCall.@pyglobalobj :PyModule_Type) ||
                pyisinstance(mo, PyCall.@pyglobalobj :PyType_Type)
            if mo == PyCall.inspect
                continue
            end
            # Before recursing, check if we've seen this python module before
            if !haskey(_pyrecwrap_cache, mo)
                _pyrecwrap_cache[mo] = pyrecwrap(mo, skiplist=skiplist)
            end
            mm = _pyrecwrap_cache[mo]
            push!(consts, Expr(:const, Expr(:(=), symbol(ms), mm)))
        else
            push!(consts, Expr(:const, Expr(:(=), symbol(ms), convert(PyAny, mo))))
        end
    end
    exports = try
                  convert(Vector{Symbol}, o["__all__"])
              catch
                  [symbol(x[1]) for x in filter(x -> x[1][1] != '_', members)]
              end
    eval(m, Expr(:toplevel, consts..., :(pymember(s) = $(getindex)($(o), s)),
                 Expr(:export, exports...)))
    m
end

