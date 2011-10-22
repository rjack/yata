(head, req) ->
    Mustache = require 'vendor/lib/mustache'

    provides 'html', ->

        partials =
            body: @templates.partials.body_list
            head: @templates.partials.head

        title = req.path[req.path.length - 1]

        view =
            shows_root: "/#{req.path[0..-4].concat(['_show', 'item']).join('/')}"
            head:
                title: title
            body:
                title: title
                items: (while (row = getRow())
                    row)

        Mustache.to_html @templates.html5, view, partials
