require 'spec_helper'

describe LikesController do
  describe "POST #create" do
    let(:user) { FactoryGirl.create :user }
    let(:place) { FactoryGirl.create :place_with_checkin }
    it "assigns @user as the correct user" do
      simulate_login
      post :create, checkin_id: place.checkins.last.id
      expect(assigns(:user).id).to eq(user.id)
    end

    it "creates a like linked to the correct liker" do
      simulate_login
      post :create, checkin_id: place.checkins.last.id
      expect(Like.last.liker_id).to eq(user.id)
    end

    it "redirects to the correct checkin" do
      simulate_login
      checkin = place.checkins.last
      post :create, checkin_id: checkin.id
      expect(response).to redirect_to([place, checkin])
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create :user }
    let(:place) { FactoryGirl.create :place_with_checkin }
    let(:like) { Like.create(liker_id: user.id, likeable_type: "Checkin", likeable_id: place.checkins.last.id)}
    it "finds and deletes the correct instance of Like" do
      simulate_login
      post :create, checkin_id: place.checkins.last.id
      delete :destroy, id: Like.last.id, checkin_id: place.checkins.last.id, user_id: user.id
      expect(Like.find_by(liker_id: user.id)).to be nil
    end

    it "redirects to the correct checkin" do
      simulate_login
      checkin = place.checkins.last
      post :create, checkin_id: place.checkins.last.id
      delete :destroy, id: Like.last.id, checkin_id: place.checkins.last.id, user_id: user.id
      expect(response).to redirect_to([place, checkin])
    end
  end
end