class AddQuestionTypeReferenceToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :questions, :question_types, name: "index_questions_on_question_type_id"
  end
end
