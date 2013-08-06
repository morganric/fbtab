class RemoveFbPageIdFromTabs < ActiveRecord::Migration
  def up
    remove_column :tabs, :fb_page_id
  end

  def down
    add_column :tabs, :fb_page_id, :integer
  end
end
