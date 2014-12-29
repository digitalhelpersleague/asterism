module Sequel
  module FindOrCreateOrInitializeVariable

    def find_or_initialize_variable(key, val)
      v = where('appdata LIKE ?', "#{key}=%").first ||
        model.new({
          appdata: "#{key}=#{val}",
          association_reflection[:key] => model_object.context
        })
      v.appdata = "#{key}=#{val}"
      v
    end

    def find_or_create_variable(key, val)
      find_or_initialize_variable(key, val).tap do |v|
        v.save
        return v
      end
    end
  end
end
