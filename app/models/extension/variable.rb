class Extension::Variable < Extension

  dataset_module do
    def variables
      filter({ exten: 'setvariables', app: 'Set' }).order(:priority)
    end

    def find_by_key(key)
      where('appdata LIKE ?', "#{key}=%")
    end
  end

  set_dataset(self.variables)

  def before_validation
    set_priority
    super
  end

  #def method_missing(args, &block)
    #puts args
    #case args
    #when String
      #to_hash[args]
    #when Symbol
      #to_hash[args.to_s]
    #else
      #nil
    #end
  #end

  def key
    to_hash && to_hash.keys.first
  end

  def value
    to_hash && to_hash.values.first
  end

  def to_hash
    appdata.match(/(.*)=(.*)/){ |m| { m[1] => m[2] } }
  end

  private

  def set_priority
    return if priority
    self.priority = self.class.where(context: context).order(:priority).select_map(:priority).last.to_i+1
  end

  def default_attributes
    { exten: 'setvariables', app: 'Set' }
  end

  #def self.set_variable!(key, new_value)
    #get_variable(key).tap do |value|
      #return if value == new_value
      ## TODO: if variable object exists rewrite
      ## TODO: if variable object not exists create new
    #end
  #end
end
