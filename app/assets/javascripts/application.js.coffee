#= require jquery
#= require jquery_ujs
#
#= require bootstrap-sass-official/transition
#= require bootstrap-sass-official/alert
#= require bootstrap-sass-official/collapse
#= require bootstrap-sass-official/button
#= require bootstrap-sass-official/modal
#
#= require lodash
#= require moment
#
#= require angular
#= require angular-animate
#= require angular-resource
#= require angular-sanitize
#= require angular-moment
#
#= require ng-rails-csrf
#
#= require_self
#= require_tree .

@rism = angular.module 'rism', ['ngResource', 'ng-rails-csrf', 'ngSanitize', 'angularMoment', 'ngAnimate']
@rism.value 'data', window.gon

$ ->
  $('.alert-dismissible[role="alert"]').delay(12000).fadeOut('slow')