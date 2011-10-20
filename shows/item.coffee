(doc, req) ->
    Mustache = require 'vendor/lib/mustache'
    jade = require 'vendor/lib/jade'

    provides 'html', ->

        start headers:
            'Content-Type': 'text/html'

        doc.is_doc = true

        if req.query?.render is 'jade'
            send jade.render @templates.html5_jade, locals: doc
        else
            send Mustache.to_html @templates.html5_mustache, doc
        null
