Sequel.migration do
  change do

    create_table :extensions do
      primary_key :id
      String :context, null: false
      String :exten
      Integer :priority, null: false, default: 0
      String :app, null: false, default: ''
      String :appdata, null: false, default: ''
    end

  end
end
