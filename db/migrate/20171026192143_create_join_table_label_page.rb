class CreateJoinTableLabelPage < ActiveRecord::Migration[5.1]
  def change
    create_join_table :labels, :pages do |t|
      # t.index [:label_id, :page_id]
      # t.index [:page_id, :label_id]
    end
  end
end
