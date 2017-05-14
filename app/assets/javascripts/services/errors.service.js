angular.module('app').service('ErrorsService', function (toast) {
    return {
        showErrors: function (errors) {
            errors.forEach(function (error) {
                toast.show(error, 10000);
            });
        }
    };
});