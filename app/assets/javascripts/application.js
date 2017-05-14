// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
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
        'angular-toast'
    ]);