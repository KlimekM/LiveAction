class Comment < ActiveRecord::Base
  belongs_to :checkin
  belongs_to :commenter, class_name: "User"

  validates :text, presence: true

  def comment_author?(current_user)
    self.commenter_id == current_user.id
  end
end
