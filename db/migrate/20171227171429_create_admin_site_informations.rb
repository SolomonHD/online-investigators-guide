class CreateAdminSiteInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_site_informations do |t|
      t.string :name
      t.text :text
      t.string :url
      
      t.timestamps
    end
  end
end
