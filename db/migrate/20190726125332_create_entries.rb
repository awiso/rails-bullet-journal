class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :content
      t.references :journal, foreign_key: true
      t.boolean :done
      t.string :scope
      t.string :type

      t.timestamps
    end
  end
end
