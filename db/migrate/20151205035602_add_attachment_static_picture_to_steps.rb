class AddAttachmentStaticPictureToSteps < ActiveRecord::Migration
  def self.up
    change_table :steps do |t|
      t.attachment :static_picture
    end
  end

  def self.down
    remove_attachment :steps, :static_picture
  end
end
