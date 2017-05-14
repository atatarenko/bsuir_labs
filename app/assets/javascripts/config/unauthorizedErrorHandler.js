angular
    .module('app')
    .config(function($httpProvider) {
        $httpProvider.interceptors.push(interceptor);

        function interceptor($q, $injector) {
            return {
                responseError: function(response) {
                    if (response.status === 401) {
                        $injector.get('$state').go('signIn');
                    }
                    return $q.reject(response);
                }
            };
        }
    });