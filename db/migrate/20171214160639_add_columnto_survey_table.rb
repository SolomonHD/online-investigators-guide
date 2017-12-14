class AddColumntoSurveyTable < ActiveRecord::Migration[5.1]
  def change
    add_column :surveys, :is_default, :boolean
  end
end
