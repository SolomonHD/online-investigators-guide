class AddColumnToAdminBrokenLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_broken_links, :link_error, :string
  end
end
