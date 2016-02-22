# Original Python:
#   from pyx import *

#   c = canvas.canvas()
#   c.stroke(path.line(0, 0, 4, 0),
#           [style.linewidth.THICK, style.linestyle.dashed, color.rgb.red])
#   c.stroke(path.line(0, -1, 4, -1),
#           [style.linewidth(0.2), style.linecap.round, color.rgb.green])
#   c.fill(path.rect(0, -3, 4, 1), [color.rgb.blue])
#   c.writeEPSfile("style")
#   c.writePDFfile("style")
#   c.writeSVGfile("style")

using PyX

c = canvas.canvas()
stroke(c, path.line(0, 0, 4, 0),
          [style_linewidth.THICK,
           style_linestyle.dashed,
           color_rgb.red])
stroke(c, path.line(0, -1, 4, -1),
          [style.linewidth(0.2),
           style_linecap.round,
           color_rgb.green])
pyx_fill(c, path.rect(0, -3, 4, 1),
        [color_rgb.blue])

writeEPSfile(c, "style")
writePDFfile(c, "style")
