class AddDetailsToSlideshowPic < ActiveRecord::Migration
  def change
    add_column :slideshow_pics, :destination_type, :integer
    add_column :slideshow_pics, :destination_id, :integer
  end
end
