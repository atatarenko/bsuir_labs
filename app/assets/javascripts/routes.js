angular.module('app').config(function ($stateProvider, $urlRouterProvider) {
    [
        {
            name: 'home',
            url: '/',
            controller: 'HomeController as self',
            templateUrl: 'home.html'
        },
        {
            name: 'terms',
            url: '/terms',
            controller: 'TermsController as self',
            templateUrl: 'terms.html'
        },
        {
            name: 'subjects',
            url: '/terms/:termId/subjects',
            controller: 'SubjectsController as self',
            templateUrl: 'subjects.html'
        },
        {
            name: 'signIn',
            url: '/sign_in',
            controller: 'SignInController as self',
            templateUrl: 'sign_in.html'
        },
        {
            name: 'signUp',
            url: '/sign_up',
            controller: 'SignUpController as self',
            templateUrl: 'sign_up.html'
        },
        { name: 'otherwise', url: '/otherwise', template: '<h1>404</h1>' }
    ].forEach(function(state) { $stateProvider.state(state) });

    $urlRouterProvider.when('', '/');
    $urlRouterProvider.otherwise('/otherwise');
});
