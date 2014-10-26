Sequel.migration do
  change do
    alter_table :sip do
      add_column :number, String
    end
  end
end
