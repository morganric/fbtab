class AddFbPageIdToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :fb_page_id, :string
  end
end
