class CreateDirectoryFiles < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :name
      t.references :parent
      t.timestamps
    end
    create_table :files do |t|
      t.string :name
      t.references :directory
      t.text :content
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE directories
        ADD CONSTRAINT fk_dir_self
        FOREIGN KEY (parent_id)
        REFERENCES directories(id)
    SQL

    execute <<-SQL
      ALTER TABLE files
        ADD CONSTRAINT fk_file_dir
        FOREIGN KEY (directory_id)
        REFERENCES directories(id)
    SQL
  end
  def down
    drop_table :directories
  end

end
