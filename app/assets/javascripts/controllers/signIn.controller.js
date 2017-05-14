angular.module('app').controller('SignInController', function($state, $rootScope, Auth) {
    var self = this;
    self.email = "";
    self.password = "";

    self.signIn = function () {
        var config = { headers: { 'X-HTTP-Method-Override': 'POST' } };
        var credentials = { email: self.email,  password: self.password };
        Auth.login(credentials, config).then(function() {
            $state.go('terms');
        });
    };
});