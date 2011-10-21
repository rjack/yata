(head, req) ->
    Mustache = require 'vendor/lib/mustache'

    provides 'html', ->
        start headers:
            'Content-Type': 'text/html'

        rows = while (row = getRow())
            #JSON.stringify row
            row

        send Mustache.to_html @templates.html5_mustache,
            title: 'Listona'
            rows: rows
            "list?": true
