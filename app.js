var couchapp = require('couchapp'),
    path = require('path');

var ddoc = {
    _id:'_design/yata',
    views: {},
    lists: {},
    shows: {},
    rewrites : []
  };

ddoc.validate_doc_update = function (newDoc, oldDoc, userCtx) {   
    // Originariamente solo admin poteva cancellare doc.
    // Preferisco assegnare a un user il ruolo `eraser'.
    if (newDoc._deleted === true && userCtx.roles.indexOf('eraser') === -1) {
        throw "Since you are not an eraser, you cannot delete documents.";
    }
};

// Serve per Backbone
ddoc.views.by_collection = {
    map: function (doc) {
        if (doc.collection) {
            emit(doc.collection, doc);
        }
    }
};



ddoc.views.by_tags = {
    // key: tag
    // value: title oppure inizio della description oppure null
    map: function (doc) {
        var blurb;
        if (doc.tags) {
            var blurb = doc.title;
            if (!blurb && doc.description) {
                blurb = doc.description.split(' ').slice(0, 5).join(' ') + ' [...]';
            }
            for (var idx in doc.tags) {
                emit(doc.tags[idx], blurb || null)
            }
        }
    },

    // key: tag
    // value: numero di doc con quella tag
    // Usabile per fare il tag cloud
    reduce: function (keys, values, rereduce) {
        if (rereduce)
            return sum(values);
        return keys.length;
    }
};

couchapp.loadAttachments(ddoc, path.join(__dirname, 'attachments'));

module.exports = ddoc;
