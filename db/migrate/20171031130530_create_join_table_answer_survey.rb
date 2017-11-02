class CreateJoinTableAnswerSurvey < ActiveRecord::Migration[5.1]
  def change
    create_join_table :answers, :surveys do |t|
      # t.index [:answer_id, :survey_id]
      # t.index [:survey_id, :answer_id]
    end
  end
end
