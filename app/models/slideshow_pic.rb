class SlideshowPic < ActiveRecord::Base
  belongs_to :slideshow
  # width to height ratio: 2.51, 72px dpi
  has_attached_file :picture, styles: { default: "1920x762#", preview: "300x119#" },
    path: ":rails_root/public/images/slideshow/:id/:style/:filename",
    url: "/images/slideshow/:id/:style/:filename"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  enum destination_types: { article: 0, movie: 1, url: 2, review: 3 }
  validates :destination_url, 
    format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix,
              message: "URL must start with http/https" },
    length: { in: 6..60 },
    allow_blank: true
  validates :destination_id, length: { maximum: 7, message: "Maximum ID length = 7" },
    allow_blank: true
end
