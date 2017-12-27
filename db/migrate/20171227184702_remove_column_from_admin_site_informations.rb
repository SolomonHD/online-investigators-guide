class RemoveColumnFromAdminSiteInformations < ActiveRecord::Migration[5.1]
  def change
    remove_column :admin_site_informations, :url
  end
end
