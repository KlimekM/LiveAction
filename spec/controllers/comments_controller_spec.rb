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
      let(:user) { FactoryGirl.create :user }
      let(:place) { FactoryGirl.create :place_with_checkin }
      let(:checkin) { FactoryGirl.create :checkin, place_id: place.id }
      let(:comment) { FactoryGirl.build :comment, text: ""}
      it "assigns 'The comment can not be blank.' as a flash[:notice]" do
        session[:user_id] = user.id
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(flash[:notice]).to eq("The comment can not be blank.")
      end

      it "renders the edit view" do
        session[:user_id] = user.id
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create :user }
    let(:place) { FactoryGirl.create :place_with_checkin }
    let(:checkin) { FactoryGirl.create :checkin, place_id: place.id }
    let(:comment) { FactoryGirl.create :comment }
    it "finds and deletes the correct instance of Comment" do
      session[:user_id] = user.id
      post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
      delete :destroy, id: Comment.last.id, place_id: place.id, checkin_id: checkin.id
      expect(Comment.find_by(commenter_id: user.id)).to be nil
    end

    it "redirect to the correct checkin" do
      session[:user_id] = user.id
      post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
      delete :destroy, id: Comment.last.id, place_id: place.id, checkin_id: checkin.id
      expect(response).to redirect_to([place, checkin])
    end
  end
end