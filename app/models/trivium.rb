class Trivium < ActiveRecord::Base
  belongs_to :person
  belongs_to :movie

  enum context: { general: 0, movie: 1, person: 2 }
end
