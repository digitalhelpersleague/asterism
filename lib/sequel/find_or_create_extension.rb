module Sequel
  module FindOrCreateExtension
    def find_or_create(vals)
      first(vals) || model.create(
        vals.merge(
          association_reflection[:key] => model_object.context
        )
      )
    end
  end
end
