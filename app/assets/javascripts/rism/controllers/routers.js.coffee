@rism.controller "rism.RoutersCtrl", ["$scope", "Router", ($scope, Router) ->

  $scope.$on '$locationChangeSuccess', ->
    switch $scope.location.path()
      when '/new'
        $scope.new()
      when '/'
        $scope.cancel()
      else
        if match = $scope.location.path().match /\/edit\/(.*)/
          $scope.edit(parseInt(match[1]))

  $scope.routers = Router.all()

  $scope.destroy = (router) ->
    router.$delete().then ->
      $scope.routers = _.without $scope.routers, router

  $scope.edit = (id) ->
    router = _.select(Router.all(), (r) -> r.id == id)[0]
    $scope.router = angular.copy(router)

  $scope.cancel = ->
    $scope.router = undefined
    $scope.location.path('/') if $scope.location.path() != '/'

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
    $scope.router.$save().then ->
      $scope.routers.push($scope.router)
      $scope.cancel()
    , (error) ->
      router.error = error.data.error

  $scope.update = ->
    $scope.router.$update().then ->
      index = _.findIndex($scope.routers, { id: $scope.router.id })
      $scope.routers[index] = $scope.router
      $scope.cancel()
    , (error) ->
      router.error = error.data.error
]
