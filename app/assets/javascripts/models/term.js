angular
    .module('app')
    .factory('Term', function ($resource) {
        return $resource('api/terms/:id', { id: '@id' }, {
            update: { method: 'PUT' }
        });
    });

