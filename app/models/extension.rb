class Extension < Sequel::Model
  def validate
    super
    validates_presence [:context, :exten, :priority, :app, :appdata]
  end
end
