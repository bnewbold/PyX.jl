# Original Python:
#   from pyx import *

#   c = canvas.canvas()
#   p = path.line(0, 0, 2, 2)
#   p.append(path.curveto(2, 0, 3, 0, 4, 0))
#   c.stroke(p)
#   c.stroke(p, [deformer.smoothed(1.0), color.rgb.blue])
#   c.stroke(p, [deformer.smoothed(2.0), color.rgb.red])
#   c.writeEPSfile("smoothed")
#   c.writePDFfile("smoothed")
#   c.writeSVGfile("smoothed")

using PyX

c = canvas.canvas()
p = path.line(0, 0, 2, 2)
pyx_append(p, path.curveto(2, 0, 3, 0, 4, 0))
stroke(c, p)
stroke(c, p, [deformer.smoothed(1.0), color_rgb.blue])
stroke(c, p, [deformer.smoothed(2.0), color_rgb.red])
writeEPSfile(c, "smoothed")
writePDFfile(c, "smoothed")
