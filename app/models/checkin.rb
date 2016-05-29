class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many   :comments, foreign_key: :commentable_id
  has_many   :likes, foreign_key: :likeable_id

  def self.convert_to_date(param_hash)
    date = Date.new(param_hash["date_attended(1i)"].to_i, param_hash["date_attended(2i)"].to_i, param_hash["date_attended(3i)"].to_i)
  end
end
