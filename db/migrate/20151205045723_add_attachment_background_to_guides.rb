class AddAttachmentBackgroundToGuides < ActiveRecord::Migration
  def self.up
    change_table :guides do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :guides, :background
  end
end
