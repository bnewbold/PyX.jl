
This is a Julia wrapper of the PyX plotting and TeX graphics library from
Python.

It is a work in progress, broken, and will set your computer on fire.

## Example

```
using PyX

g = graph.graphxy(width=8)
plot(graph_data_function("y(x)=sin(x)/x", min=-15, max=15))
writeEPSfile(g, "function")
writePDFfile(g, "function")
writeSVGfile(g, "function")
```

## Install

There are no installation instructions.

## Notes and Caveats

PyX >= 0.13 (2013) is Python3 only. PyX <= 0.12.1 is Python2.

Instead of Python's `None`, use Julia's `nothing`.

`graph_data.function` won't work in Julia because `function` is a reserved
word. Use `graph_data_function` instead.

Also check the TODO file.

