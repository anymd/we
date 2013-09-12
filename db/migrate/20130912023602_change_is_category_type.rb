class ChangeIsCategoryType < ActiveRecord::Migration
  def change
    remove_column :items, :is_category
    add_column :items, :is_category, :boolean
  end
end
