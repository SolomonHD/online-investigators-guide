class CreateQuestionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_types do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
end
