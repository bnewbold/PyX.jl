# Original Python:
#   from pyx import *

#   c = canvas.canvas()
#   c.stroke(path.rect(0, 0, 1, 1), [style.linewidth.Thick,
#                                   color.rgb.red,
#                                   deco.filled([color.rgb.green])])
#   c.writeEPSfile("strokefill")
#   c.writePDFfile("strokefill")
#   c.writeSVGfile("strokefill")

using PyX

c = canvas.canvas()
stroke(c, path.rect(0, 0, 1, 1),
          [style_linewidth.Thick,
           color_rgb.red,
           deco.filled([color_rgb.green])])
writeEPSfile(c, "strokefill")
writePDFfile(c, "strokefill")
