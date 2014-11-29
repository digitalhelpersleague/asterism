Sequel.migration do
  change do
    alter_table :media do
      add_column :original_filename, String
    end
  end
end
