angular
    .module('app')
    .factory('Lab', function ($resource) {
        return $resource('api/terms/:termId/subjects/:subjectId/labs/:id',
            {
                id: '@id',
                termId: '@termId',
                subjectId: '@subjectId'
            },
            {
                update: { method: 'PUT' }
            }
        );
    });

