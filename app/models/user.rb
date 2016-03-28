class User < ActiveRecord::Base
	has_many :comments, foreign_key: :commenter_id
	has_many :likes, foreign_key: :liker_id
	has_many :friendships, foreign_key: :friend_1_id
  has_many :friends, through: :friendships, source: :friend
  has_many :checkins
  has_many :checked_in_places, through: :checkins

  validates :username, :first_name, :last_name, :email, { presence: true}
  has_secure_password
end
