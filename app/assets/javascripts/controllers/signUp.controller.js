angular.module('app').controller('SignUpController', function($state, Auth) {
    var self = this;
    self.email = "";
    self.password = "";
    self.passwordConfirmation = null;

    self.signUp = function () {
        var config = { headers: { 'X-HTTP-Method-Override': 'POST' } };
        var credentials = {
            email: self.email,
            password: self.password,
            password_confirmation: self.passwordConfirmation
        };

        Auth.register(credentials, config).then(function() {
            $state.go('terms');
        });
    };
});