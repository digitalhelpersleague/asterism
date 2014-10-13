Sequel.migration do
  change do

    create_table :sip do
      primary_key :id
      String :accountcode
      String :disallow, default: 'all'
      String :allow, default: 'g729;ilbc;gsm;ulaw;alaw'
      String :allowoverlap, default: 'yes'
      String :allowsubscribe, default: 'yes'
      String :allowtransfer
      String :amaflags
      String :autoframing
      String :auth
      Boolean :buggymwi, default: false
      String :callgroup
      String :callerid
      String :cid_number
      String :fullname
      Integer :'call-limit', default: 0
      String :callingpres
      String :canreinvite, default: 'yes'
      String :context
      String :defaultip
      String :dtmfmode
      String :fromuser
      String :fromdomain
      String :fullcontact
      String :g726nonstandard, default: 'no'
      String :host, null: false, default: 'dynamic'
      String :insecure
      String :ipaddr
      String :language
      String :lastms
      String :mailbox
      Integer :maxcallbitrate, default: 384
      String :mohsuggest
      String :md5secret
      String :musiconhold
      String :name, null: false, default: ''
      String :nat, null: false, default: 'no'
      String :outboundproxy
      String :deny
      String :permit
      String :pickupgroup
      String :port, null: false, default: ''
      String :progressinband, default: 'no'
      String :promiscredir, default: 'no'
      String :qualify # char(3)
      String :regexten, null: false, default: ''
      Integer :regseconds, null: false, default: 0
      String :rfc2833compensate, default: 'no'
      String :rtptimeout # char(3)
      String :rtpholdtimeout # char(3)
      String :secret
      String :sendrpid, default: 'yes'
      String :setvar, null: false, default: ''
      String :subscribecontext
      String :subscribemwi
      String :t38pt_udptl, default: 'no'
      String :trustrpid, default: 'no'
      String :type, null: false, default: 'friend'
      String :useclientcode, default: 'no'
      String :defaultuser
      String :usereqphone, null: false, default: 'no'
      String :videosupport, default: 'yes'
      String :vmexten
      String :useragent
      String :regserver
      String :callbackextension
    end
    add_index :sip, :name, unique: true

  end
end
