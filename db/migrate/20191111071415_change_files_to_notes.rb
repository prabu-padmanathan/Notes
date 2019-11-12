class ChangeFilesToNotes < ActiveRecord::Migration
  def up
  	create_table :notes do |t|
      t.string :name
      t.references :directory , foreign_key: {on_delete: :cascade}
      t.text :content
      t.timestamps
    end
  end

  def down
  	drop_table :notes
  end
end
