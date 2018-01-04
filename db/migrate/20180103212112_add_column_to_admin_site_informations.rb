class AddColumnToAdminSiteInformations < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_site_informations, :isOn, :boolean
  end
end
