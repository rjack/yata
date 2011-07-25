$(function () {
    Backbone.couchConnector.databaseName = 'yata-dev';
    Backbone.couchConnector.ddocName = 'yata';
    Backbone.couchConnector.viewName = 'by_collection';

    window.DocumentModel = Backbone.Model.extend({
        defaults: {
            author: 'anonimo',
            title: 'senza titolo'
        }
    });

    window.DocumentCollection = Backbone.Collection.extend({
        url: '/documents',
        model: DocumentModel
    });


    window.documents = new DocumentCollection();
    window.doc = documents.create({});
});
