class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.references :survey_template, foreign_key: true

      t.timestamps
    end
  end
end
