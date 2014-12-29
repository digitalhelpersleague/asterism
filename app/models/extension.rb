class Extension < Sequel::Model
  def validate
    super
    validates_presence [:context, :exten, :priority, :app, :appdata]
  end

  def before_validation
    set_default_attributes
    super
  end

  def after_commit
    set_default_variables
    # TODO: rebuild_relatives_tree
    # TODO: do each extension changes in one transaction
  end

  def after_save
    Sequel.transaction do
      variables.each do |variable|
        variable.save if variable.modified?
      end
    end
  end

  def after_destroy
    # TODO: Destroy all extensions with same context
    # TODO: Unlink all extensions which redirects to this context (eg. Routers)
    Sequel.transaction do
      # relatives_dataset.delete_all
    end
  end

  one_to_many :relatives,
    class: ::Extension,
    extend: [
      ::Sequel::FindOrSomethingExtension
    ],
    key: :context,
    primary_key: :context

  one_to_many :variables,
    class: ::Extension::Variable,
    extend: [
      ::Sequel::FindOrSomethingExtension,
      ::Sequel::FindOrCreateOrInitializeVariable
    ],
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

  def self.find_by_context(context)
    where('context ILIKE ?', "%#{context}%").where(app: 'NoOp')
  end

  def variables
    @variables ||= super
  end

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

  #def rebuild_relatives_tree
  #end

  def set_variable(key, value)
    # TODO: google how to use variables_dataset while object is not created yet
    variables_dataset.find_or_initialize_variable(key, value).tap do |variable|
      # TODO: find and replace variable in @variables with new one
    end
  end

  def set_default_variables
    default_variables.each do |key, value|
      set_variable(key, value)
    end
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
