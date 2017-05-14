angular.module('app').run(function ($rootScope, ErrorsService) {
    $rootScope.$on('httpResponseWithError', function(event, errors) {
        ErrorsService.showErrors(errors);
    });
});