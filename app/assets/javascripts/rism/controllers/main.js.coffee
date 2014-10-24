@rism.controller "rism.MainCtrl", ["$scope", "data", ($scope, data) ->
  #$scope.current_user = data.current_user

  $scope.generate_secret = (selector) ->
    safe_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-~@%&*+'
    password = _.sample(_.shuffle(safe_chars.split('')), _.random(8,12)).join('')
    field = angular.element(selector)
    if field.length > 0
      field.val(password)
      $scope.zxcvbn = zxcvbn(field.val())
    password
]
