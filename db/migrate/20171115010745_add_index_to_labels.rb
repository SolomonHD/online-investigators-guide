class AddIndexToLabels < ActiveRecord::Migration[5.1]
  def change
    add_index :labels, :name, unique: true
  end
end
