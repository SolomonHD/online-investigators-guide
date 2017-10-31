class AddColumnToPagesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :is_numbered, :boolean
  end
end
