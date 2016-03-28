class Place < ActiveRecord::Base
	has_many :likes
	has_many :comments
	has_many :checkins
	has_many :visitors, through: :checkins, class_name: "User"
end
