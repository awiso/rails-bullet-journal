class RenameTypeToEntryType < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries, :type, :entry_type
  end
end
