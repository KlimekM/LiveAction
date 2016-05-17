class Place < ActiveRecord::Base
  has_many :likes, foreign_key: :likeable_id
  has_many :comments
  has_many :checkins
  has_many :visitors, through: :checkins, source: :user
end
