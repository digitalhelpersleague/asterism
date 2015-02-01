#= require jquery
#= require jquery_ujs
#= require jquery-ui
#
#FIXME: jsplumb have not main js file. need to do something
#= require jsPlumb/dist/js/jquery.jsPlumb-1.7.2
#
#= require bootstrap-sass-official/bootstrap/affix
#= require bootstrap-sass-official/bootstrap/transition
#= require bootstrap-sass-official/bootstrap/alert
#= require bootstrap-sass-official/bootstrap/collapse
#= require bootstrap-sass-official/bootstrap/button
#= require bootstrap-sass-official/bootstrap/modal
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

@rism = angular.module 'rism', ['ngResource', 'ng-rails-csrf', 'ngSanitize', 'angularMoment', 'ngAnimate', 'pasvaz.bindonce']
@rism.value 'data', window.gon

@rism.config ($locationProvider) ->
  $locationProvider.html5Mode(false)

#window.jsPlumbInstance = null

$ ->
  #window.jsPlumbInstance = jsPlumb.getInstance(
    #Endpoint: [
      #"Dot"
      #{
        #radius: 5
      #}
    #]
    #HoverPaintStyle:
      #strokeStyle: "#623e68"
      #lineWidth: 2

    #ConnectionOverlays: [
      #[
        #"Arrow"
        #{
          #location: 1
          #id: "arrow"
          #length: 14
          #foldback: 0.8
        #}
      #]
      #[
        #"Label"
        #{
          #label: "GoTo"
          #id: "label"
          #cssClass: "aLabel"
        #}
      #]
    #]
  #)

  $('.alert-dismissible[role="alert"]').delay(12000).fadeOut('slow')
