class Like < ActiveRecord::Base
  belongs_to :place
  belongs_to :checkin
  belongs_to :liker, class_name: "User"
end
