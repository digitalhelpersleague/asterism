@rism.factory "Sip", ["$resource", "data", ($resource, data) ->

  Sip = $resource("/sips/:id.json", { id: '@id' },
    update: { method: 'PUT' }
  )

  cache = do ->
    if data.sips?
      _.map(data.sips, (sip) -> new Sip(sip))

  Sip.all = ->
    cache || Sip.query()

  Sip
]
