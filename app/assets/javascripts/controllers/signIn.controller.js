angular.module('app').controller('SignInController', function($state, $rootScope, Auth) {
    var self = this;
    self.email = "";
    self.password = "";
    self.needToRemember = true;

    self.signIn = function () {
        var config = { headers: { 'X-HTTP-Method-Override': 'POST' } };
        var credentials = { email: self.email,  password: self.password };
        Auth.login(credentials, config).then(function(user) {
            // TODO Remove
            console.log(user);
            $state.go('home');
        });
    };
});