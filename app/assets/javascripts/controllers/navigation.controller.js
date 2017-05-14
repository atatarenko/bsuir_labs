angular
    .module('app')
    .controller('NavigationController', function($state, Auth) {
        var self = this;

        Auth.currentUser().then(function(user) {
        });

        self.isAuthenticated = function () {
            return Auth.isAuthenticated();
        };

        self.signOut = function () {
            var config = { headers: { 'X-HTTP-Method-Override': 'DELETE' } };
            Auth.logout(config).finally(function () {
                $state.go('signIn');
            });
        };
    });
