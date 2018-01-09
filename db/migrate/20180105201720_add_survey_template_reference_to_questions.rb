class AddSurveyTemplateReferenceToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :questions, :survey_templates, name: "index_questions_on_survey_template_id"
  end
end
