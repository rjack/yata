Mustache = require 'vendor/lib/mustache'

(doc, req) ->
    provides 'html', ->

        start headers:
            'Content-Type': 'text/html'

        doc.is_doc = true

        Mustache.to_html @templates.html5, doc
