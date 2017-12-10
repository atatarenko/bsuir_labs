angular
  .module('app')
  .factory('Teacher', function ($resource) {
    return $resource('api/teachers/:id', { id: '@id' }, {
      update: { method: 'PUT' }
    });
  });
