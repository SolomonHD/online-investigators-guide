class CreateSurveyTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
