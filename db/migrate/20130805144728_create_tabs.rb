class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
