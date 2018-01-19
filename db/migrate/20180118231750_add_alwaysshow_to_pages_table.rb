class AddAlwaysshowToPagesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :alwaysShow, :boolean
  end
end
