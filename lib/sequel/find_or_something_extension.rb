module Sequel
  module FindOrSomethingExtension
    def find_or_create(vals)
      first(vals) || model.create(
        vals.merge(
          association_reflection[:key] => model_object.context
        )
      )
    end

    def find_or_initialize(vals)
      first(vals) || model.new(
        vals.merge(
          association_reflection[:key] => model_object.context
        )
      )
    end

  end
end
