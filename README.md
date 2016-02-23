
This is a Julia wrapper of the PyX plotting and TeX graphics library from
Python.

It is a work in progress, broken, and will set your computer on fire.

## Example

```
using PyX

g = graph.graphxy(width=8)
plot(g, graph_data_function("y(x)=sin(x)/x", min=-15, max=15))
writeEPSfile(g, "function")
writePDFfile(g, "function")
writeSVGfile(g, "function")
```

## Install

There are no installation instructions.

## Notes and Caveats

To run tests, do something like:

    JULIA_LOAD_PATH=src julia test/runtests.jl

PyX >= 0.13 (2013) is Python3 only. PyX <= 0.12.1 is Python2.

Instead of Python's `None`, use Julia's `nothing`.

`graph_data.function` won't work in Julia because `function` is a reserved
word. Use `graph_data_function` instead.

To avoid namespace collisions or confusion with built-in Julia functions the
following functions have "pyx_" preprended to the function name:

    pyx_fill, pyx_append, pyx_insert, pyx_text

Also check the TODO file.

For pipeGS (ghostscript file conversion) output, see:
http://www.ghostscript.com/doc/current/Devices.htm
