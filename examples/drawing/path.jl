# Original Python:
#   from pyx import *

#   c = canvas.canvas()
#   c.stroke(path.line(0, 0, 3, 0))
#   c.stroke(path.rect(0, 1, 1, 1))
#   c.fill(path.circle(2.5, 1.5, 0.5))
#   c.writeEPSfile("path")
#   c.writePDFfile("path")
#   c.writeSVGfile("path")

using PyX

c = canvas.canvas()
stroke(c, path.line(0, 0, 3, 0))
stroke(c, path.rect(0, 1, 1, 1))
pyx_fill(c, path.circle(2.5, 1.5, 0.5))

writeEPSfile(c, "path")
writePDFfile(c, "path")
