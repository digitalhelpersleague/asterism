
#ExtensionAttribute.create(
  #{ name: 'dnd',
    #value_type: 'integer',
    #default_value: '0'
  #},
  #{ name: 'busytime',
    #value_type: 'integer',
    #default_value: '60'
  #},
  #{ name: 'allowmetransfer',
    #value_type: 'string',
    #default_value: 't'
  #},
  #{ name: 'allowhimtransfer',
    #value_type: 'string',
    #default_value: 't'
  #},
  #{ name: 'greeting',
    #value_type: 'integer',
    #default_value: '0'
  #}
#)

Router.create({
  context: 'R0001',
  exten: 's',
  priority: 1,
  app: 'NoOp',
  appdata: 'ROUTER'
})
Router.create({
  context: 'R0001',
  exten: '_1XX',
  priority: 1,
  app: 'GoTo',
  appdata: '${EXTEN},s,1'
})
Router.create({
  context: 'R0002',
  exten: 's',
  priority: 1,
  app: 'NoOp',
  appdata: 'ROUTER'
})
Router.create({
  context: 'R0001',
  exten: '_2XX',
  priority: 1,
  app: 'GoTo',
  appdata: '${EXTEN},s,1'
})

Ivr.create({
  context: 'I0001',
  exten: 's',
  priority: '1',
  app: 'NoOp',
  appdata: 'IVR'
})
Ivr.create({
  context: 'I0001',
  exten: 'setvariables',
  priority: '1',
  app: 'Set',
  appdata: 'media=/tmp/asdasd.wav'
})
Ivr.create({
  context: 'I0001',
  exten: '1',
  priority: '1',
  app: 'GoTo',
  appdata: 'I0002,s,1'
})
Ivr.create({
  context: 'I0002',
  exten: 's',
  priority: '1',
  app: 'NoOp',
  appdata: 'IVR'
})
Ivr.create({
  context: 'I0002',
  exten: 'setvariables',
  priority: '1',
  app: 'Set',
  appdata: 'media=/tmp/asdasd2.wav'
})
Ivr.create({
  context: 'I0003',
  exten: 's',
  priority: '1',
  app: 'NoOp',
  appdata: 'IVR'
})
Ivr.create({
  context: 'I0003',
  exten: 'setvariables',
  priority: '1',
  app: 'Set',
  appdata: 'media=/tmp/vladimirsky_tsentral.wav'
})
Ivr.create({
  context: 'I0003',
  exten: '#',
  priority: '1',
  app: 'GoTo',
  appdata: 'I0001,s,1'
})
Ivr.create({
  context: 'I0004',
  exten: 's',
  priority: '1',
  app: 'NoOp',
  appdata: 'IVR'
})
Ivr.create({
  context: 'I0004',
  exten: 'setvariables',
  priority: '1',
  app: 'Set',
  appdata: 'media=/tmp/support_loop.wav'
})
Ivr.create({
  context: 'I0004',
  exten: '*',
  priority: '1',
  app: 'GoTo',
  appdata: 'I0004,s,1'
})

