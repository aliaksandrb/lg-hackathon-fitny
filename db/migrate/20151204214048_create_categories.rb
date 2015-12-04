class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id, null: true
      t.integer :lft, null: false
      t.integer :rgt, null: false
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0

      t.timestamps null: false
    end
    add_index :categories, :parent_id
    add_index :categories, :lft
    add_index :categories, :rgt
  end
end
