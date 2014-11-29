class Extension < Sequel::Model
  def validate
    super
    validates_presence [:context, :exten, :priority, :app, :appdata]
  end

  def before_validation
    set_default_attributes
    super
  end

  def after_create
    set_default_variables
  end

  def after_destroy # FIXME: after_commit
    # TODO: Destroy all extensions with same context
    # TODO: Unlink all extensions which redirects to this context (eg. Routers)
  end

  one_to_many :variables,
    class: ::Extension::Variable,
    extend: ::Sequel::FindOrCreateVariable,
    key: :context,
    primary_key: :context

  def validate
    super
    validates_presence :context
    validates_presence :exten
    validates_presence :app
    validates_presence :appdata
    validates_unique [:context, :exten, :app, :appdata]
  end

  #def variables
    ##@variables ||= Variable
  #end

  #def variables=(vars)
    #vars.each do |key, value|
      #variables.send(key).tap do |var|
        #next if var == value
        #@variables.push(variables.create(context: context)) if var.nil?
      #end
    #end
  #end

  # TODO: return from setvariables procedure

  private

  def set_variable!(key, value)
    variables_dataset.find_or_create_variable(key, value)
    # klass.variables.find_by_key(key) || Variable.find_or_create_by_key()
    # TODO: initialize or create Variable instance
  end

  def relatives
    @relatives ||= relatives_dataset.to_a
  end

  def relatives_dataset
    Extension.where(context: context)
      .exclude(id: id)
  end

  def set_default_variables
    # TODO: Sequel.transaction do
      #default_variables.each do |key, value|
        #set_variable!(key, value)
      #end
    #ena
  end

  def set_default_attributes
    default_attributes.each do |attribute, value|
      next unless self.send(attribute).nil?
      self.send("#{attribute}=", value)
    end
  end

  def default_attributes
    {}
  end

  def default_variables
    # TODO: escape strings with single quotes
    {}
  end
end
