(doc, req) ->
    provides 'html', ->
        start headers:
            'Content-Type': 'text/html'


        "<h1>#{doc.title}</h1><p>#{doc.description}</p>"
