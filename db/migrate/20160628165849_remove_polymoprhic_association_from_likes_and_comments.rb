class RemovePolymoprhicAssociationFromLikesAndComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_type, :string
    remove_column :comments, :commentable_id, :integer
    remove_column :likes, :likeable_type, :string
    remove_column :likes, :likeable_id, :integer
  end
end
