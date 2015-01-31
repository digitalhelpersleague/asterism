@rism.directive 'ngPlumb', ['$document', ($document) ->
  restrict: 'A'
  link: (scope, element, attributes) ->
    # setup some defaults for jsPlumb.
    scope.ngPlumb = window.jsPlumbInstance

    $document.ready ->
      $blocks = element.children('.w')

      element_width = 140
      element_height = 40
      padding = 100

      rows = 2
      index = 0

      _.each $blocks, ($block) ->
        offsetTop = element_height + padding
        if (index % 3) == 0
          offsetTop += offsetTop / 2

        offsetLeft = element_width + padding

        top = Math.floor(index / rows) * offsetTop
        left = index % rows * offsetLeft

        $($block).css('top', top+'px')
        $($block).css('left', left+'px')
        index += 1

      #TODO: mosaic by targets count


      # initialise draggable elements.
      window.jsPlumbInstance.draggable $blocks

      # bind a click listener to each connection; the connection is deleted. you could of course
      # just do this: jsPlumb.bind('click', jsPlumb.detach), but I wanted to make it clear what was
      # happening.
      #window.jsPlumbInstance.bind 'click', (c) ->
        ## c.toggle('')
        #return

      #window.jsPlumbInstance.bind 'dblclick', (c) ->
        #window.jsPlumbInstance.detach c
        #return

      # bind a connection listener. note that the parameter passed to this function contains more than
      # just the new connection - see the documentation for a full list of what is included in 'info'.
      # this listener sets the connection's internal
      # id as the label overlay's text.
      #window.jsPlumbInstance.bind 'connection', (info) ->
        #console.log info
        #info.connection.getOverlay('label').setLabel '<b>hello</b>'
        ## info.connection.getOverlay('label').setLabel info.connection.id
        #return


      # suspend drawing and initialise.
      window.jsPlumbInstance.doWhileSuspended ->
        # make each '.ep' div a source and give it some parameters to work with.  here we tell it
        # to use a Continuous anchor and the StateMachine connectors, and also we give it the
        # connector's paint style.  note that in this demo the strokeStyle is dynamically generated,
        # which prevents us from just setting a jsPlumb.Defaults.PaintStyle.  but that is what i
        # would recommend you do. Note also here that we use the 'filter' option to tell jsPlumb
        # which parts of the element should actually respond to a drag start.
        # here we test the capabilities of the library, to see if we
        # can provide a `filter` (our preference, support by vanilla
        # jsPlumb and the jQuery version), or if that is not supported,
        # a `parent` (YUI and MooTools). I want to make it perfectly
        # clear that `filter` is better. Use filter when you can.
        window.jsPlumbInstance.makeSource $blocks,
          filter: '.ep'
          anchor: 'Continuous'
          connector: [
            'StateMachine'
            {
              curviness: 20
            }
          ]
          connectorStyle:
            strokeStyle: '#AA5CBC'
            lineWidth: 2
            outlineColor: 'transparent'
            outlineWidth: 4

          #maxConnections: 5
          #onMaxConnections: (info, e) ->
            #alert 'Maximum connections (' + info.maxConnections + ') reached'
            #return

      # initialise all '.w' elements as connection targets.
      window.jsPlumbInstance.makeTarget $blocks,
        dropOptions:
          hoverClass: 'dragHover'

        anchor: 'Continuous'
        allowLoopback: true
        anchor: 'Continuous'

      #jsPlumb.fire 'jsPlumbDemoLoaded', window.jsPlumbInstance
]

@rism.directive 'ngPlumbTargets', ['$document', ($document) ->
  restrict: 'A'
  scope:
    ngPlumbTargets: '=',
  link: (scope, element, attributes) ->
    $document.ready ->
      _.each scope.ngPlumbTargets, (target) ->
        connection = window.jsPlumbInstance.connect
          source: element.attr('id')
          target: target.context

        #connection.getOverlay('label').setLabel '<div class="ng-scope ng-binding">{{ ivr.context }}</div>'
        connection.getOverlay('label').setLabel target.code
        #TODO: Not angular's stuff
        connection.bind 'click', -> #FIXME: need element.bind here
          #console.log "asdsadsa"
          if $(@.getOverlay('label').getElement()).children('input').size()
            $(@.getOverlay('label').getElement()).html target.code
          else
            input = '<input type="text" class="target-code form-control" />'
            $(@.getOverlay('label').getElement()).html(input)

          #.toggleClass('clicked')
]
