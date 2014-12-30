@rism.controller "rism.CallQueuesCtrl", ["$scope", "CallQueue", ($scope, CallQueue) ->

  $scope.$on '$locationChangeSuccess', ->
    switch $scope.location.path()
      when '/new'
        $scope.new()
      when '/'
        $scope.cancel()
      else
        if match = $scope.location.path().match /\/edit\/(.*)/
          $scope.edit(parseInt(match[1]))

  $scope.call_queues = CallQueue.all()

  $scope.destroy = (call_queue) ->
    call_queue.$delete().then ->
      $scope.call_queues = _.without $scope.call_queues, call_queue

  $scope.edit = (id) ->
    call_queue = _.select(CallQueue.all(), (r) -> r.id == id)[0]
    $scope.call_queue = angular.copy(call_queue)

  $scope.cancel = ->
    $scope.call_queue = undefined
    $scope.location.path('/') if $scope.location.path() != '/'

  $scope.new = ->
    $scope.call_queue = new CallQueue({})

  $scope.filter = ->
    unless $scope.q
      $scope.call_queues = CallQueue.all()
      return
    $scope.call_queues = _.filter CallQueue.all(), (call_queue) ->
      call_queue.context.toLowerCase().indexOf($scope.q.toLowerCase()) > -1
    return false

  $scope.create = ->
    $scope.call_queue.$save().then ->
      $scope.call_queues.push($scope.call_queue)
      $scope.cancel()
    , (error) ->
      call_queue.error = error.data.error

  $scope.update = ->
    $scope.call_queue.$update().then ->
      index = _.findIndex($scope.call_queues, { id: $scope.call_queue.id })
      $scope.call_queues[index] = $scope.call_queue
      $scope.cancel()
    , (error) ->
      call_queue.error = error.data.error
]
