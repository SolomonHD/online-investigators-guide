class ChangeQuestionTypeIdToBeBigintInQuestions < ActiveRecord::Migration[5.1]
  def up
    change_column :questions, :question_type_id, :bigint
  end
end
