angular
    .module('app')
    .factory('Subject', function ($resource) {
        return $resource('api/terms/:termId/subjects/:id', { id: '@id', termId: '@termId' }, {
            update: { method: 'PUT' }
        });
    });

