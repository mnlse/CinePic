class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { big: "150x225" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :username, length: { in: 3..20, 
    too_short: "must have a minimum of %{count} characters", 
    too_long: "must be no longer than %{count} characters" },
    allow_blank: true
  validates :bio, length: { maximum: 400, 
    too_long: "must be no longer than %{count} characters" },
    allow_blank: true
  validates :first_name, :last_name, 
    length: { maximum: 20, too_long: "must be no longer than %{count} characters" },
    format: { with: /\A[a-zA-Z]+\Z/, message: "must contain only letters from A to Z" },
    allow_blank: true

  has_many :articles
  has_many :comments
  has_many :ratings
end
