class AddPromotesToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :promoted, :boolean, null: false, default: false
  end
end
