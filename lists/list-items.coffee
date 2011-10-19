(head, req) ->
    provides 'html', ->
        start headers:
            'Content-Type': 'text/html'

        send '<ul>'
        while row = getRow()
            send "<li><a href=\"/yata/_design/yata/_show/item/#{row.id}\">#{row.value.doc_title}</li>"

        send '</ul>'

