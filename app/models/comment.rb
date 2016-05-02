class Comment < ActiveRecord::Base
  belongs_to :place
  belongs_to :checkin
  belongs_to :commenter, class_name: "User"

  validates :text, presence: true
end
