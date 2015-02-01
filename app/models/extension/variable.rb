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

  def key
    to_hash && to_hash.keys[0]
  end

  def value
    to_hash && to_hash.values[0]
  end

  def to_hash
    appdata.match(/(.*)=(.*)/){ |m| { m[1] => unescape_value(m[2]) } }
  end

  def method_missing(method, *args, &block)
    method = method.to_s
    case method[-1..-1]
    when '?'
      key == method[0..-2]
    when '='
      self.appdata = "#{method[0..-2]}=#{escape_value(args.first)}"
    else
      to_hash[method]
    end
  end

  def set_variable
  end

  private

  def escape_value(val)
    case val
    when Integer
      val
    when String
      value_escaped?(val) ? val : "'#{val}'"
    when Symbol
      escape_value(val.to_s)
    else
      raise RuntimeError, 'value has wrong type'
    end
  end

  def unescape_value(val)
    value_escaped?(val) ? val[1..-2] : val
  end

  def value_escaped?(val)
    val[0] == val[-1] && val[0].in?(['"', "'"])
  end

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
