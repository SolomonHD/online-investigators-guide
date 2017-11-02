class AddIsDefaultToSurveyTemplates < ActiveRecord::Migration[5.1]
  def change
    add_column :survey_templates, :is_default, :boolean
  end
end
