class AddColumnAdminSiteInformation < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_site_informations, :header, :string
  end
end
