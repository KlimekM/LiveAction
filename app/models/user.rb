class User < ActiveRecord::Base
  has_many :comments, foreign_key: :commenter_id
  has_many :likes, foreign_key: :liker_id
  has_many :friendships, foreign_key: :friend_1_id
  has_many :friends, through: :friendships, source: :friend
  has_many :checkins
  has_many :visited_places, through: :checkins, source: :place

  validates :username, :first_name, :last_name, :email, { presence: true}
  has_secure_password

  def own_profile?(user)
    self.id == user.id
  end

  def already_friends?(user)
    self.friends.include?(user)
  end

  def already_liked?(checkin)
    self.likes.find_by(liker_id: self.id, checkin_id: checkin.id)
  end
end
