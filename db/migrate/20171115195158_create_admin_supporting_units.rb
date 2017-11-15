class CreateAdminSupportingUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_supporting_units do |t|
      t.string :unit
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
