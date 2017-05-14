angular
    .module('app')
    .run(function(Auth, $rootScope, $state) {
        $rootScope.$on('$stateChangeStart', function (event, toState) {
            if (!Auth.isAuthenticated()) {
                if (toState.name !== 'signIn' && toState.name !== 'signUp') {
                    event.preventDefault();
                    $state.go('signIn');
                }
            }
        });
    });
