@rism.directive 'ngZxcvbn', ->
  restrict: 'A'
  scope:
    ngZxcvbn: '=',
  link: (scope, element, attributes) ->
    element.bind 'input', (changeEvent) ->
      scope.$apply ->
        scope.ngZxcvbn = if $(element).val() then zxcvbn($(element).val()) else null
