angular
  .module('app')
  .factory('Mark', function ($resource) {
    return $resource('api/marks')
  });
