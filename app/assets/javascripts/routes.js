angular.module('app').config(function ($stateProvider, $urlRouterProvider) {
    [
        {
            name: 'terms',
            url: '/terms',
            controller: 'TermsController as self',
            templateUrl: 'terms.html'
        },
        {
          name: 'teachers',
          url: '/teachers',
          controller: 'TeachersController as self',
          templateUrl: 'teachers.html'
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
        {
            name: 'not_found',
            url: '/404',
            templateUrl: 'errors/404.html'
        }
    ].forEach(function(state) { $stateProvider.state(state) });

    $urlRouterProvider.when('', '/terms');
    $urlRouterProvider.otherwise('/404');
});
