@rism.controller "rism.SipsCtrl", ["$scope", "Sip", ($scope, Sip) ->

  $scope.sips = Sip.all()

  $scope.destroy = (sip) ->
    sip.$delete().then ->
      $scope.sips = _.without $scope.sips, sip

  #new_sip = ->
    #sip = Sip.new()
    #sip.edit = true
    #$scope.sips.push(sip)

]
