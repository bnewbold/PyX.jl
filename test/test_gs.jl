
function try_gs(el)

    writeGSfile(el, "/tmp/asdfasdf2.png", "png16m")
    writeGSfile(el, "/tmp/asdfasdf2.jpeg", "jpeg")
    pipeGS(el)
    pipeGS(el, "png16m")
    pipeGS(el, "jpeg")
    true
end

@test try_gs(c)
@test try_gs(g)
@test try_gs(g3d)

