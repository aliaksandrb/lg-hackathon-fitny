class AddAttachmentVideoToSteps < ActiveRecord::Migration
  def self.up
    change_table :steps do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :steps, :video
  end
end
