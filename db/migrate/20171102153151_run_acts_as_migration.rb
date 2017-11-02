class RunActsAsMigration < ActiveRecord::Migration[5.1]
  def change
    Page.order(:updated_at).each.with_index(1) do |page, index|
      page.update_column :position, index
    end
  end
end
