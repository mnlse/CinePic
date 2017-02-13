class Rating < ActiveRecord::Base
  range = (1..10)
  validates :rating, inclusion: { in: range }

  belongs_to :user
  belongs_to :movie
end
