@rism.controller "rism.RoutersCtrl", ["$scope", "Router", ($scope, Router) ->

  $scope.routers = Router.all()

  $scope.destroy = (router) ->
    router.$delete().then ->
      $scope.routers = _.without $scope.routers, router

  $scope.edit = (router) ->
    $scope.router = angular.copy(router)

  $scope.cancel = ->
    $scope.router = undefined

  $scope.new = ->
    $scope.router = new Router({})

  $scope.filter = ->
    unless $scope.q
      $scope.routers = Router.all()
      return
    $scope.routers = _.filter Router.all(), (router) ->
      router.context.toLowerCase().indexOf($scope.q.toLowerCase()) > -1
    return false

  $scope.create = ->
    $scope.router.exten = 's'
    $scope.router.priority = 1
    $scope.router.app = 'NoOp'
    $scope.router.appdata = 'ROUTER'
    $scope.router.$save().then ->
      $scope.routers.push($scope.router)
      $scope.cancel()
    , (error) ->
      router.error = error.data.error

  $scope.update = ->
    $scope.router.$update().then ->
      index = _.findIndex($scope.routers, { id: $scope.router.id })
      console.log index
      $scope.routers[index] = $scope.router
      console.log $scope.router
      $scope.cancel()
    , (error) ->
      router.error = error.data.error

]
