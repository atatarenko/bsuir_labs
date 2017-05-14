// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require angular/angular.min
//= require angular-animate/angular-animate.min
//= require angular-aria/angular-aria.min
//= require angular-material/angular-material.min
//= require angular-messages/angular-messages.min
//= require angular-ui-router/release/angular-ui-router.min
//= require AngularDevise/lib/devise-min.js
//= require angular-resource/angular-resource.min
//= require angular-toast/dist/angular-toast.min
//= require chart.js/dist/Chart.min
//= require angular-chart.js/dist/angular-chart.min
//= require ng-sortable/dist/ng-sortable.min
//= require angular-rails-templates
//= require_tree ../templates
//= require_self
//= require_tree .

angular
    .module('app', [
        'ui.router',
        'ngAnimate',
        'ngMaterial',
        'ngResource',
        'ngMessages',
        'templates',
        'Devise',
        'angular-toast',
        'chart.js',
        'as.sortable'
    ]);