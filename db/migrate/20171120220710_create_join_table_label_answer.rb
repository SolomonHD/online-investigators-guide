class CreateJoinTableLabelAnswer < ActiveRecord::Migration[5.1]
  def change
    create_join_table :labels, :answers do |t|
      # t.index [:label_id, :answer_id]
      # t.index [:answer_id, :label_id]
    end
  end
end
