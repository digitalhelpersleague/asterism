@rism.controller "rism.SipsCtrl", ["$scope", "Sip", "Router", ($scope, Sip, Router) ->

  $scope.routers = Router.all()

  $scope.generate_secret = (sip) ->
    safe_chars = _.shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ_-~@%&*+abcdefghijklmnopqrstuvwxyz0123456789'.split(''))
    password = _.sample(safe_chars, _.random(9,12)).join('')
    sip.secret = password
    $scope.zxcvbn = zxcvbn(password)

  $scope.$on '$locationChangeSuccess', ->
    switch $scope.location.path()
      when '/new'
        $scope.new()
      when '/'
        $scope.cancel()
      else
        if match = $scope.location.path().match /\/edit\/(.*)/
          $scope.edit(parseInt(match[1]))

  $scope.sips = Sip.all()

  $scope.destroy = (sip) ->
    sip.$delete().then ->
      $scope.sips = _.without $scope.sips, sip

  $scope.edit = (id) ->
    clean_variables()
    sip = _.select(Sip.all(), (s) -> s.id == id)[0]
    $scope.sip = angular.copy(sip)

  $scope.cancel = ->
    clean_variables()
    $scope.location.path('/') if $scope.location.path() != '/'

  $scope.new = ->
    clean_variables()
    $scope.sip = new Sip({})

  $scope.filter = ->
    unless $scope.q
      $scope.sips = Sip.all()
      return
    $scope.sips = _.filter Sip.all(), (sip) ->
      sip.fullname.toLowerCase().indexOf($scope.q.toLowerCase()) > -1 ||
        sip.number.toLowerCase().indexOf($scope.q.toLowerCase()) > -1
    return false

  $scope.create = ->
    $scope.sip.$save().then ->
      $scope.sips.push($scope.sip)
      $scope.cancel()
    , (error) ->
      sip.error = error.data.error

  $scope.update = ->
    $scope.sip.$update().then ->
      index = _.findIndex($scope.sips, { id: $scope.sip.id })
      $scope.sips[index] = $scope.sip
      $scope.cancel()
    , (error) ->
      sip.error = error.data.error

  clean_variables = ->
    $scope.zxcvbn = undefined
    $scope.sip = undefined

]
