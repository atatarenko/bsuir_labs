angular.module('app').config(function ($httpProvider) {
    $httpProvider.interceptors.push(interceptor);

    function interceptor($q, $rootScope) {
        return {
            responseError: function(response) {
                var errorMessages = [];

                if (!!response.data.error) {
                    errorMessages.push(response.data.error);
                }

                if (!!response.data.errors) {
                    var errors = response.data.errors;
                    Object.keys(errors).forEach(function(attribute) {
                        errors[attribute].forEach(function (errorMessage) {
                            errorMessages.push(attribute + ': ' + errorMessage);
                        });
                    });
                }

                $rootScope.$broadcast('httpResponseWithError', errorMessages);
                return $q.reject(response);
            }
        };
    }
});