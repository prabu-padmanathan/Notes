class CreateUserTable < ActiveRecord::Migration
  def change
  	create_table :notes_users do |t|
      t.string :name
      t.string :password
      t.timestamps
    end
    add_column :directories, :notes_user_id, :integer
    add_foreign_key :directories , :notes_users , index: true,foreign_key: {on_delete: :cascade}
  end

  def down
  	drop_table :notes_users
  end
end
