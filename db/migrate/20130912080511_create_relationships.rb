class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :item_relationships, :id => false, :force => true do |t|
      t.integer :item_a_id, :null => false
      t.integer :item_b_id, :null => false

      t.timestamps
    end
  end
end