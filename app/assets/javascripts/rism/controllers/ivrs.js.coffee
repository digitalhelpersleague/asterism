@rism.controller "rism.IvrsCtrl", ["$scope", "Ivr", ($scope, Ivr) ->

  $scope.$on '$locationChangeSuccess', ->
    switch $scope.location.path()
      when '/new'
        $scope.new()
      when '/'
        $scope.cancel()
      else
        if match = $scope.location.path().match /\/edit\/(.*)/
          $scope.edit(parseInt(match[1]))

  $scope.ivrs = Ivr.all()

  $scope.destroy = (ivr) ->
    ivr.$delete().then ->
      $scope.ivrs = _.without $scope.ivrs, ivr

  $scope.edit = (id) ->
    ivr = _.select(Ivr.all(), (r) -> r.id == id)[0]
    $scope.ivr = angular.copy(ivr)

  $scope.cancel = ->
    $scope.ivr = undefined
    $scope.location.path('/') if $scope.location.path() != '/'

  $scope.new = ->
    $scope.ivr = new Ivr({})

  $scope.filter = ->
    #TODO: unlink jsPlumb's connections and recreate new
    unless $scope.q
      $scope.ivrs = Ivr.all()
      return
    $scope.ivrs = _.filter Ivr.all(), (ivr) ->
      #TODO: crutch to just hide unfiltered elements, not completelu remove them
      ivr.context.toLowerCase().indexOf($scope.q.toLowerCase()) > -1
    return false

  $scope.create = ->
    $scope.ivr.$save().then ->
      $scope.ivrs.push($scope.ivr)
      $scope.cancel()
    , (error) ->
      ivr.error = error.data.error

  $scope.update = ->
    $scope.ivr.$update().then ->
      index = _.findIndex($scope.ivrs, { id: $scope.ivr.id })
      $scope.ivrs[index] = $scope.ivr
      $scope.cancel()
    , (error) ->
      ivr.error = error.data.error
]
