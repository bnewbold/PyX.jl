
This is a Julia wrapper of the PyX plotting and TeX graphics library from
Python.

It is a work in progress, broken, and will set your computer on fire. See also
the TODO file.

*Source Code:* https://github.com/bnewbold/PyX.jl
*Travis CI:* https://travis-ci.org/bnewbold/PyX.jl

## Example

```
using PyX

g = graph.graphxy(width=8)
plot(g, graph_data_function("y(x)=sin(x)/x", min=-15, max=15))
```

There are many (ported) examples in the ./examples/ directory of this
repository. See the Python PyX upstream documentation for example outputs:

    http://pyx.sourceforge.net/

## Dependencies and Python Version

You'll obviously need the underlying Python PyX library installed, plus any
dependencies (eg, LaTeX and Ghostscript). These are pretty huge and complex
packages to install! Use something like Debian's `apt` or Homebrew on OS X. No
idea how to get this set up on Windows or other platforms.

*NOTE:* PyX versions starting with 0.13 are Python3-only. PyX versions 0.12.1
and earlier are Python2-only. This split happened back in 2013. This wrapper
will work with versions on either side of the split, but the newer versions
(starting with PyX 0.14) support SVG and newer features. Unfortunately,
switching Julia's PyCall wrapper from Python2 to Python3 is all or nothing.
Careful! If you decide to do this, run:

    julia> ENV["PYTHON"] = "/usr/bin/python3" # Or your local full path
    julia> Pkg.build("PyCall")

### Install

This package is not (yet) listed in the official Julia MANIFEST.jl index, so
you'll need to install it "unregistered" style:

    julia> Pkg.clone("https://github.com/bnewbold/PyX.jl")
    julia> using PyX

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

## License

Following the license of the underlying PyX python library, this wrapper is
licensed under the GNU GPL Version 2 (or later). See the LICENSE file, and the
upstream licensing note:

    http://pyx.sourceforge.net/license.html

