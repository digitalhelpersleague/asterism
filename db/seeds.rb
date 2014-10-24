
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
