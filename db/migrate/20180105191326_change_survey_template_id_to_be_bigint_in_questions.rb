class ChangeSurveyTemplateIdToBeBigintInQuestions < ActiveRecord::Migration[5.1]
  def up
    change_column :questions, :survey_template_id, :bigint
  end
end
