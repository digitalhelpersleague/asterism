module Sequel
  class RecordNotFound < Error; end

  Model.instance_eval do
    def find!(args)
      m = self[args]
      fail RecordNotFound, "Couldn't find #{self} matching #{args}." unless m
      m
    end

    alias_method :update_attributes, :update
  end
end
