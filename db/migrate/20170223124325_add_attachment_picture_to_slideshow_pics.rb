class AddAttachmentPictureToSlideshowPics < ActiveRecord::Migration
  def self.up
    change_table :slideshow_pics do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :slideshow_pics, :picture
  end
end
