class Person < ActiveRecord::Base
  has_many :comments
  has_many :trivium
  has_and_belongs_to_many :movies
end
