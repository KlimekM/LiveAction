class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many   :comments
  has_many   :likes

  validates_presence_of :date_attended

  def self.convert_to_date(param_hash)
    date = Date.new(param_hash["date_attended(1i)"].to_i, param_hash["date_attended(2i)"].to_i, param_hash["date_attended(3i)"].to_i)
  end
end
