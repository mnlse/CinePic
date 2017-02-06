class AddAttachmentCoverImgToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.attachment :cover_img
    end
  end

  def self.down
    remove_attachment :movies, :cover_img
  end
end
