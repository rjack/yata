(doc, req) ->
    Mustache = require 'vendor/lib/mustache'

    provides 'html', ->


        partials =
            body: @templates.partials.body_generic
            head: @templates.partials.head

        view =
            title: doc.title
            author: doc.author
            body:
                content: doc.description.html

        Mustache.to_html @templates.html5, view, partials
