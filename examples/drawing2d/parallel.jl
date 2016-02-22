# Original Python:
#   from pyx import *

#   c = canvas.canvas()
#   p = path.line(0, 0, 2, 2)
#   p.append(path.curveto(2, 0, 3, 0, 4, 0))
#   c.stroke(p)
#   c.stroke(p, [deformer.parallel(0.2), color.rgb.blue])
#   c.stroke(p, [deformer.parallel(-0.2), color.rgb.red])
#   c.writeEPSfile("parallel")
#   c.writePDFfile("parallel")
#   c.writeSVGfile("parallel")

using PyX

c = canvas.canvas()
p = path.line(0, 0, 2, 2)
pyx_append(p, path.curveto(2, 0, 3, 0, 4, 0))
stroke(c, p)
stroke(c, p, [deformer.parallel(0.2), color_rgb.blue])
stroke(c, p, [deformer.parallel(-0.2), color_rgb.red])
writeEPSfile(c, "parallel")
writePDFfile(c, "parallel")
