@rism.factory "Ivr", ["$resource", "data", ($resource, data) ->

  Ivr = $resource("/ivrs/:id.json", { id: '@id' },
    update: { method: 'PUT' }
    #TODO: check if we need this stuff
    save:
      params:
        'X-Progress-ID': "@progress_token"
      method: 'POST'
      transformRequest: (data, getHeaders) ->
        headers = getHeaders()
        headers["Content-Type"] = undefined
        return data if data is undefined
        fd = new FormData()
        angular.forEach data, (value, key) ->
          if value instanceof FileList
            if value.length is 1
              fd.append "ivr[#{key}]", value[0]
            else
              angular.forEach value, (file, index) ->
                fd.append "#{key}[#{index}]#{file}"
                return
          else
            fd.append "ivr[#{key}]", value
          return
        fd
  )

  cache = do ->
    if data.ivrs?
      _.map(data.ivrs, (ivr) -> new Ivr(ivr))

  Ivr.all = ->
    cache || Ivr.query()

  Ivr::remove_transition = (transition) ->
    @transitions = _.without @transitions, transition

  Ivr::add_transition = ->
    @transitions ||= []
    @transitions.push {}

  Ivr
]
