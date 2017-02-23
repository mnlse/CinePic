class Slideshow < ActiveRecord::Base
  has_many :slideshow_pics, dependent: :destroy
end
