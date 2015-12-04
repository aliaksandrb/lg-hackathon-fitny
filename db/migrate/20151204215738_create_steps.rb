class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name, null: false
      t.integer :timer, null: false, default: 0
      t.integer :line_number, null: false, default: 1

      t.belongs_to :layout_type, null: false, index: true
      t.belongs_to :guide, null: false, index: true

      t.timestamps null: false
    end
    add_foreign_key :steps, :guides
    add_foreign_key :steps, :layout_types
  end
end
