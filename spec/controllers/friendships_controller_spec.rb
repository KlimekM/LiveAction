require 'spec_helper'

describe FriendshipsController do
  describe "POST #create" do
    let(:user) { FactoryGirl.create :user }
    let(:user_two) { FactoryGirl.create :user }
    it "adds user_two as a friend of user" do
      session[:user_id] = user.id
      post :create, id: user_two.id
      expect(user.friends.first).to eq(user_two)
    end

    it "adds user as a friend of user_two" do
      session[:user_id] = user.id
      post :create, id: user_two.id
      expect(user_two.friends.first).to eq(user)
    end

    it "redirects to the appropriate user's profile" do
      session[:user_id] = user.id
      post :create, id: user_two.id
      expect(response).to redirect_to(user_two)
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create :user }
    let(:user_two) { FactoryGirl.create :user }
    it "deletes user_two as a friend of user" do
      session[:user_id] = user.id
      post :create, id: user_two.id
      delete :destroy, id: user_two.id
      expect(user.friends.last).to_not eq(user_two)
    end

    it "deletes user as a friend of user_two" do
      session[:user_id] = user.id
      post :create, id: user_two.id
      delete :destroy, id: user_two.id
      expect(user_two.friends.last).to_not eq(user)
    end

    it "redirects to the appropriate user's profile" do
      session[:user_id] = user.id
      post :create, id: user_two.id
      delete :destroy, id: user_two.id
      expect(response).to redirect_to(user_two)
    end
  end
end