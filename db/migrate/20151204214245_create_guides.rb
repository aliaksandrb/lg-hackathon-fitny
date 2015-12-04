class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name, null: false
      t.belongs_to :category, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :guides, :categories
    add_foreign_key :guides, :users
  end
end
