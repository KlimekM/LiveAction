require 'spec_helper'

describe LikesController do
  describe "POST #create" do
    let(:user) { FactoryGirl.create :user }
    let(:place) { FactoryGirl.create :place_with_checkin }
    it "creates a like linked to the correct liker" do
      session[:user_id] = user.id
      post :create, checkin_id: place.checkins.last.id
      expect(Like.last.liker_id).to eq(user.id)
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create :user }
    let(:place) { FactoryGirl.create :place_with_checkin }
    let(:like) { Like.create(liker_id: user.id, likeable_type: "Checkin", likeable_id: place.checkins.last.id)}
    it "deletes a like" do
      session[:user_id] = user.id
      post :create, checkin_id: place.checkins.last.id
      delete :destroy, id: Like.last.id, checkin_id: place.checkins.last.id, user_id: user.id
      expect(Like.find_by(liker_id: user.id)).to be nil
    end
  end
end