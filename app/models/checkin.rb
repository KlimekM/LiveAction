class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many   :comments
  has_many   :likes

  validate :date_attended_cannot_be_in_the_future, on: [:create, :update]

  def self.convert_to_date(param_hash)
    date = Date.new(param_hash["date_attended(1i)"].to_i, param_hash["date_attended(2i)"].to_i, param_hash["date_attended(3i)"].to_i)
  end

  def date_attended_cannot_be_in_the_future
    if date_attended > Date.today
      errors.add(:date_attended, "can't be in the future")
    end
  end

  def creator?(current_user)
    self.user.id == current_user.id
  end
end
