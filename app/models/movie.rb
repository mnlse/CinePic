class Movie < ActiveRecord::Base
  has_attached_file :cover_img, styles: { front_page: "300x180>", show_page: "180x280" }
  validates_attachment :cover_img, content_type: { content_type: /\Aimage/ }, presence: true, size: { less_than: 2.megabytes }

  has_many :ratings
  has_and_belongs_to_many :people
end
