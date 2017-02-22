class Person < ActiveRecord::Base
  has_many :comments
  has_many :trivium
  belongs_to :movie
end
