couchapp = require 'couchapp'
path = require 'path'


ddoc =
    _id:'_design/yata'
    views: {}
    lists: {}
    shows: {}
    rewrites : []


ddoc.validate_doc_update = (newDoc, oldDoc, userCtx) ->
    # Users must have the 'eraser' role in order to delete documents.
    if newDoc._deleted and 'eraser' not in userCtx.roles
        throw "Since you are not an eraser, you cannot delete documents."


# Todo View
# Sort todos by due date

ddoc.views.pending_tasks =
    map: (doc) ->
        if doc.tasks?.todo?
            for task in doc.tasks.todo
                emit task.due,
                    task: task.title
                    document: doc.title
        null


couchapp.loadAttachments ddoc, path.join(__dirname, 'attachments')

module.exports = ddoc
