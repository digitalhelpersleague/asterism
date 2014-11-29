Sequel.migration do
  change do

    create_table :media do
      primary_key :id
      String :file
    end

  end
end
