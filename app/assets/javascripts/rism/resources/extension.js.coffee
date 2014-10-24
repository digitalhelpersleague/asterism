@rism.factory "Extension", ["$resource", "data", ($resource, data) ->

  Extension = $resource("/extensions/:id.json", { id: '@id' },
    update: { method: 'PUT' }
  )

  cache = do ->
    if data.extensions?
      _.map(data.extensions, (extension) -> new Extension(extension))

  Extension.all = ->
    cache || Extension.query()

  Extension
]
