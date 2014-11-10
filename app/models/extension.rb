class Extension < Sequel::Model
  def validate
    super
    validates_presence [:context, :exten, :priority, :app, :appdata]
  end

  def before_validation
    set_default_attributes
    super
  end

  private

  def set_default_attributes
    default_attributes.each do |attribute, value|
      next unless self.send(attribute).nil?
      self.send("#{attribute}=", value)
    end
  end

  def default_attributes
    {}
  end
end
