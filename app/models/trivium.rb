class Trivium < ActiveRecord::Base
  belongs_to :person
  belongs_to :movie

  enum status: { general: 0, movie: 1, person: 2 }

  validates :content, length: { in: 10..200 }
end
