(doc, req) ->
    Mustache = require 'vendor/lib/mustache'
    jade = require 'vendor/lib/jade'

    provides 'html', ->

        start headers:
            'Content-Type': 'text/html'

        doc.is_doc = true

        if req.query?.render is 'jade'
            doc.engine = 'jade'
            jade.render @templates.html5_jade, locals: doc
        else
            doc.engine = 'mustache'
            Mustache.to_html @templates.html5_mustache, doc
