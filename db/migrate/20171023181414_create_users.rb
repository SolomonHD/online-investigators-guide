class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :net_id
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin

      t.timestamps
    end

    add_index :users, :net_id, unique: true
  end
end
