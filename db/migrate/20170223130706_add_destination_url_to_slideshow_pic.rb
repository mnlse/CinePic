class AddDestinationUrlToSlideshowPic < ActiveRecord::Migration
  def change
    add_column :slideshow_pics, :destination_url, :string
  end
end
