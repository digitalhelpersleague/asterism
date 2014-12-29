Sequel.migration do
  change do
    create_table :extensions_media do
      primary_key :id
      Integer :extension_id
      Integer :medium_id
    end
    add_index :extensions_media, :extension_id
    add_index :extensions_media, :medium_id

  end
end
