class Place < ActiveRecord::Base
  has_many :checkins
  has_many :visitors, through: :checkins, source: :user
end
