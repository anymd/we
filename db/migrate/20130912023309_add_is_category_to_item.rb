class AddIsCategoryToItem < ActiveRecord::Migration
  def change
    add_column :items, :is_category, :integer
  end
end
