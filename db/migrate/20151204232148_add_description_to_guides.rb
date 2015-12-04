class AddDescriptionToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :description, :text, null: false, default: ''
  end
end
