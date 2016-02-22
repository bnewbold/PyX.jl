
# Original Python:
#   from pyx import *

#   c = canvas.canvas()
#   c.stroke(path.curve(0, 0, 0, 4, 2, 4, 3, 3),
#           [style.linewidth.THICK, style.linestyle.dashed, color.rgb.blue,
#           deco.earrow([deco.stroked([color.rgb.red, style.linejoin.round]),
#                       deco.filled([color.rgb.green])], size=1)])
#   c.writeEPSfile("arrow")
#   c.writePDFfile("arrow")
#   c.writeSVGfile("arrow")


using PyX

c = canvas.canvas()
stroke(c, path.curve(0, 0, 0, 4, 2, 4, 3, 3),
          [style_linewidth.THICK, style_linestyle.dashed, color_rgb.blue,
           deco.earrow([deco.stroked([color_rgb.red, style_linejoin.round]),
                        deco.filled([color_rgb.green])], size=1)])
writeEPSfile(c, "arrow")
writePDFfile(c, "arrow")
