module Sequel
  module FindOrCreateVariable
    #include FindOrCreateExtension

    def find_or_create_variable(key, value)
      variable_object = where('appdata LIKE ?', "#{key}=%").first ||
        model.create({
          appdata: "#{key}=#{value}",
          association_reflection[:key] => model_object.context
        })
      variable_object.update(appdata: "#{key}=#{value}")
      variable_object
    end
  end
end
