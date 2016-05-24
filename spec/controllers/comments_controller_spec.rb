require 'spec_helper'

describe CommentsController do
  describe "POST #create" do
    context "when valid params are passed" do
      let(:user) { FactoryGirl.create :user }
      let(:place) { FactoryGirl.create :place_with_checkin }
      let(:checkin) { FactoryGirl.create :checkin, place_id: place.id }
      let(:comment) { FactoryGirl.build :comment }
      it "assigns @checkin as the correct instance of Checkin" do
        session[:user_id] = user.id
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(assigns(:checkin).id).to eq(checkin.id)
      end

      it "assigns @place as the correct instance of Place" do
        session[:user_id] = user.id
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(assigns(:place).id).to eq(checkin.place.id)
      end

      it "creates a new instance of Comment" do
        session[:user_id] = user.id
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(checkin.comments.count).to eq(1)
      end

      it "redirects to the appropriate checkin" do
        session[:user_id] = user.id
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(response).to redirect_to([place, checkin])
      end
    end

    context "when invalid params are passed" do
      # write test for invalid params when I fix the comments controller to handle invalid params.
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create :user }
    let(:place) { FactoryGirl.create :place_with_checkin }
    let(:checkin) { FactoryGirl.create :checkin, place_id: place.id }
    let(:comment) { FactoryGirl.create :comment }
    it "assigns comment as the correct instance of comment" do
      session[:user_id] = user.id
      post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
      delete :destroy, id: comment.id, place_id: place.id, checkin_id: checkin.id
      expect(assigns(:comment).id).to eq(checkin.comments.last.id)
    end

    it "deletes the appropriate comment" do
      session[:user_id] = user.id
      post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
      delete :destroy, id: Comment.last.id, place_id: place.id, checkin_id: checkin.id
      expect(Comment.find_by(commenter_id: user.id)).to be nil
    end
  end
end