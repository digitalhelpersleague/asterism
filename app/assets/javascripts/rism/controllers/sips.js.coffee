@rism.controller "rism.SipsCtrl", ["$scope", "Sip", ($scope, Sip) ->

  $scope.sips = Sip.all()

  $scope.destroy = (sip) ->
    sip.$delete().then ->
      $scope.sips = _.without $scope.sips, sip

  $scope.edit = (sip) ->
    $scope.sip = angular.copy(sip)

  $scope.cancel = ->
    $scope.sip = undefined

  $scope.new = ->
    $scope.sip = new Sip({})

]
