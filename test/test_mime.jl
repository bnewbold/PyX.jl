
function try_mime(el)

    for m in (MIME("application/pdf"),
              MIME("application/eps"),
              MIME("application/postscript"),
              MIME("image/png"),
              MIME("image/jpeg"),
             )
        @assert mimewritable(m, c)
        open("/dev/null", "w") do f
            writemime(f, m, el)
        end
    end

    if mimewritable(MIME("image/svg+xml"), el)
        stringmime(MIME("image/svg+xml"), el)
        open("/tmp/asdfasfd.svg", "w") do f
            writemime(f, MIME"image/svg+xml"(), el)
        end
    end
    true
end

@test try_mime(c)
@test try_mime(g)
@test try_mime(g3d)

