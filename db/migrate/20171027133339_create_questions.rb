class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :survey_template_id
      t.integer :question_type_id
      t.text :content

      t.timestamps
    end
  end
end
