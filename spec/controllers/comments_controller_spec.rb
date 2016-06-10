require 'spec_helper'

describe CommentsController do
  include SessionsHelper

  describe "POST #create" do
    context "when valid params are passed" do
      let(:user) { FactoryGirl.create :user }
      let(:place) { FactoryGirl.create :place_with_checkin }
      let(:checkin) { FactoryGirl.create :checkin, place_id: place.id }
      let(:comment) { FactoryGirl.build :comment }
      it "assigns @checkin as the correct instance of Checkin" do
        simulate_login
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(assigns(:checkin).id).to eq(checkin.id)
      end

      it "assigns @place as the correct instance of Place" do
        simulate_login
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(assigns(:place).id).to eq(checkin.place.id)
      end

      it "creates a new instance of Comment" do
        simulate_login
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(checkin.comments.count).to eq(1)
      end

      it "redirects to the appropriate checkin" do
        simulate_login
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
        simulate_login
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(flash[:notice]).to eq("The comment can not be blank.")
      end

      it "renders the edit view" do
        simulate_login
        post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "GET #edit" do
    let(:place) { FactoryGirl.create :place }
    let(:user) { FactoryGirl.create :user }
    let(:checkin) { FactoryGirl.create :checkin, place_id: place.id, user_id: user.id }
    let(:comment) { FactoryGirl.create :comment, commenter_id: user.id }
    context "when the author attempts to edit their comment" do
      it "assigns the place, checkin, and comment as the correct instance of each model" do
        get :edit, place_id: place.id, checkin_id: checkin.id, id: comment.id
        expect(assigns(:place).id).to eq(place.id)
        expect(assigns(:checkin).id).to eq(checkin.id)
        expect(assigns(:comment).id).to eq(comment.id)
      end

      it "verifies that the user attempting to edit the comment is the commenter" do
        simulate_login
        get :edit, place_id: place.id, checkin_id: checkin.id, id: comment.id
        expect(assigns(:comment).commenter.id).to eq(current_user.id)
      end
    end

    context "when a user who is not the author attempts to edit a comment" do
      it "assigns 'Not authorized to edit comment. as a flash[:notice]'" do
        get :edit, place_id: place.id, checkin_id: checkin.id, id: comment.id
        expect(flash[:notice]).to eq("Not authorized to edit comment.")
      end

      it "redirects to the places index page" do
        get :edit, place_id: place.id, checkin_id: checkin.id, id: comment.id
        expect(response).to redirect_to("/places")
      end
    end
  end

  describe "PUT #update" do
    let(:place) { FactoryGirl.create :place }
    let(:user) { FactoryGirl.create :user }
    let(:checkin) { FactoryGirl.create :checkin, place_id: place.id, user_id: user.id }
    let(:comment) { FactoryGirl.create :comment, commenter_id: user.id }
    context "when valid params are passed" do
      it "assigns @place, @checkin, and @comment as the correct instance of each model" do
        new_text = Faker::Lorem.sentence
        put :update, place_id: place.id, checkin_id: checkin.id, id: comment.id, comment: { text: new_text }
        expect(assigns(:place).id).to eq(place.id)
        expect(assigns(:checkin).id).to eq(checkin.id)
        expect(assigns(:comment).id).to eq(comment.id)
      end

      it "changes the text of the comment to new_text" do
        new_text = Faker::Lorem.sentence
        put :update, place_id: place.id, checkin_id: checkin.id, id: comment.id, comment: { text: new_text }
        expect(assigns(:comment).text).to eq(new_text)
      end

      it "redirects to the appropriate checkin" do
        new_text = Faker::Lorem.sentence
        put :update, place_id: place.id, checkin_id: checkin.id, id: comment.id, comment: { text: new_text }
        expect(response).to redirect_to([place, checkin])
      end
    end

    context "when invalid params are passed" do
      it "assigns 'The comment can not be blank.' as a flash[:notice]" do
        put :update, place_id: place.id, checkin_id: checkin.id, id: comment.id, comment: { text: "" }
        expect(flash[:notice]).to eq("The comment can not be blank.")
      end

      it "re-renders the edit page" do
        put :update, place_id: place.id, checkin_id: checkin.id, id: comment.id, comment: { text: "" }
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
      simulate_login
      post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
      delete :destroy, id: Comment.last.id, place_id: place.id, checkin_id: checkin.id
      expect(Comment.find_by(commenter_id: user.id)).to be nil
    end

    it "redirect to the correct checkin" do
      simulate_login
      post :create, place_id: place.id, checkin_id: checkin.id, comment: { text: comment.text }
      delete :destroy, id: Comment.last.id, place_id: place.id, checkin_id: checkin.id
      expect(response).to redirect_to([place, checkin])
    end
  end
end