require 'spec_helper'

describe LikesController do
  describe "POST #create" do
    # Throwing an error on line 10 here!
    let(:user) { FactoryGirl.create :user }
    let(:checkin) { FactoryGirl.create :checkin }
    it "creates a like linked to the correct liker" do
      session[:user_id] = user.id
      post :create, checkin_id: checkin.id
      expect(Like.last.liker_id).to eq(user.id)
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create :user }
    let(:checkin) { FactoryGirl.create :checkin }
    let(:like) { Like.create(liker_id: user.id, likeable_type: "Checkin", likeable_id: checkin.id)}
    it "deletes a like" do
      session[:user_id] = user.id
      post :create, checkin_id: checkin.id
      delete :destroy, id: Like.last.id, checkin_id: checkin.id, user_id: user.id
      expect(Like.find_by(liker_id: user.id)).to be nil
    end
  end
end