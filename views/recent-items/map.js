function (doc) {
    var created = null;
    if (doc.time && doc.time.created) {
        created = doc.time.created;
    }
    emit(created, {
        doc_title: doc.title,
    });
};
