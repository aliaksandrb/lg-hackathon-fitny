class AddDescriptionToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :description, :text, default: '', null: false
  end
end
