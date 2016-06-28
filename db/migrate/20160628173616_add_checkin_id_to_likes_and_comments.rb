class AddCheckinIdToLikesAndComments < ActiveRecord::Migration
  def change
    add_column :likes, :checkin_id, :integer
    add_column :comments, :checkin_id, :integer
  end
end
