Sequel.migration do
  change do
    create_table(:extensions) do
      primary_key :id
      column :context, "text", :null=>false
      column :exten, "text"
      column :priority, "integer", :default=>0, :null=>false
      column :app, "text", :default=>"", :null=>false
      column :appdata, "text", :default=>"", :null=>false
    end

    create_table(:schema_migrations) do
      column :filename, "text", :null=>false

      primary_key [:filename]
    end

    create_table(:sip) do
      primary_key :id
      column :accountcode, "text"
      column :disallow, "text", :default=>"all"
      column :allow, "text", :default=>"g729;ilbc;gsm;ulaw;alaw"
      column :allowoverlap, "text", :default=>"yes"
      column :allowsubscribe, "text", :default=>"yes"
      column :allowtransfer, "text"
      column :amaflags, "text"
      column :autoframing, "text"
      column :auth, "text"
      column :buggymwi, "boolean", :default=>false
      column :callgroup, "text"
      column :callerid, "text"
      column :cid_number, "text"
      column :fullname, "text"
      column :"call-limit", "integer", :default=>0
      column :callingpres, "text"
      column :canreinvite, "text", :default=>"yes"
      column :context, "text"
      column :defaultip, "text"
      column :dtmfmode, "text"
      column :fromuser, "text"
      column :fromdomain, "text"
      column :fullcontact, "text"
      column :g726nonstandard, "text", :default=>"no"
      column :host, "text", :default=>"dynamic", :null=>false
      column :insecure, "text"
      column :ipaddr, "text"
      column :language, "text"
      column :lastms, "text"
      column :mailbox, "text"
      column :maxcallbitrate, "integer", :default=>384
      column :mohsuggest, "text"
      column :md5secret, "text"
      column :musiconhold, "text"
      column :name, "text", :default=>"", :null=>false
      column :nat, "text", :default=>"no", :null=>false
      column :outboundproxy, "text"
      column :deny, "text"
      column :permit, "text"
      column :pickupgroup, "text"
      column :port, "text", :default=>"", :null=>false
      column :progressinband, "text", :default=>"no"
      column :promiscredir, "text", :default=>"no"
      column :qualify, "text"
      column :regexten, "text", :default=>"", :null=>false
      column :regseconds, "integer", :default=>0, :null=>false
      column :rfc2833compensate, "text", :default=>"no"
      column :rtptimeout, "text"
      column :rtpholdtimeout, "text"
      column :secret, "text"
      column :sendrpid, "text", :default=>"yes"
      column :setvar, "text", :default=>"", :null=>false
      column :subscribecontext, "text"
      column :subscribemwi, "text"
      column :t38pt_udptl, "text", :default=>"no"
      column :trustrpid, "text", :default=>"no"
      column :type, "text", :default=>"friend", :null=>false
      column :useclientcode, "text", :default=>"no"
      column :defaultuser, "text"
      column :usereqphone, "text", :default=>"no", :null=>false
      column :videosupport, "text", :default=>"yes"
      column :vmexten, "text"
      column :useragent, "text"
      column :regserver, "text"
      column :callbackextension, "text"
      column :number, "text"

      index [:name], :unique=>true
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20141011163947_create_extensions.rb')"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20141011164638_create_sips.rb')"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20141026114340_add_number_to_sip.rb')"
  end
end
