class CreateSlideshowPics < ActiveRecord::Migration
  def change
    create_table :slideshow_pics do |t|

      t.timestamps null: false
    end
  end
end
