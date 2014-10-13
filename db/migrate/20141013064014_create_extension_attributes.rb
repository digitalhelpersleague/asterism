Sequel.migration do
  change do

    create_table :extension_attributes do
      primary_key :id
      String :name
      String :value_type
      String :default_value
    end

  end
end
