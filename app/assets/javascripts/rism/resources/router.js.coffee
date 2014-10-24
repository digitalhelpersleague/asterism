@rism.factory "Router", ["$resource", "data", ($resource, data) ->

  Router = $resource("/routers/:id.json", { id: '@id' },
    update: { method: 'PUT' }
  )

  cache = do ->
    if data.routers?
      _.map(data.routers, (router) -> new Router(router))

  Router.all = ->
    cache || Router.query()

  Router::remove_route = (route) ->
    @routes = _.without @routes, route

  Router::add_route = ->
    @routes ||= []
    route = { priority: @routes.length+1 }
    @routes.push route

  Router
]
