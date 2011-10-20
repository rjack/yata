Mustache = require 'vendor/lib/mustache'

(doc, req) ->
    provides 'html', ->

        start headers:
            'Content-Type': 'text/html'


        Mustache.to_html "<h1>{{title}}</h1><p>{{description}}</p>", doc
