class AddColumnToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :ancestry_depth, :integer, :default => 0
  end
end
