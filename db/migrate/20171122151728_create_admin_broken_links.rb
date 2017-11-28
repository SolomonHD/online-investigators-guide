class CreateAdminBrokenLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_broken_links do |t|
      t.string :link_text
      t.string :page_title
      t.string :page_id
      t.string :broken_url

      t.timestamps
    end
  end
end
