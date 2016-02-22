# Original Python:
#   from math import sin, cos, radians
#   from pyx import *

#   angle = 10
#   factor = 1.0 / (cos(radians(angle)) + sin(radians(angle)))

#   cc = canvas.canvas()
#   cc.stroke(path.rect(-2, -2, 4, 4))

#   c = canvas.canvas()
#   for i in range(10):
#       c.insert(cc, [trafo.rotate(i*angle), trafo.scale(factor**i)])
#   c.writeEPSfile("insert")
#   c.writePDFfile("insert")
#   c.writeSVGfile("insert")

using PyX

angle = 10
factor = 1.0 / (cos(deg2rad(angle)) + sin(deg2rad(angle)))

cc = canvas.canvas()
stroke(cc, path.rect(-2, -2, 4, 4))

c = canvas.canvas()
for i in 0:9
    pyx_insert(c, cc, [trafo.rotate(i*angle), trafo.scale(factor^i)])
end

writeEPSfile(c, "insert")
writePDFfile(c, "insert")
