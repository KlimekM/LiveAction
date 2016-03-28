class Checkin < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	has_many   :comments
	has_many   :likes
end
