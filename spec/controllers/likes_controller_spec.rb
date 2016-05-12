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
    # Create a like to remove
    it "deletes a like" do
      session[:user_id] = user.id
      post :create, checkin_id: checkin.id
      delete :destroy
      expect(Like.find_by(liker_id: user.id)).to be nil
    end
  end
end