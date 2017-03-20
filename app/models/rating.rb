class Rating < ActiveRecord::Base
  range = (1..10)
  validates :rating, inclusion: { in: range }

  belongs_to :user
  belongs_to :movie

  def self.find_by_user_and_movie(user_id, movie_id)
    where(user_id: user_id, movie_id: movie_id).first
  end
end
