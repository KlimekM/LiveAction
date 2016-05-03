require 'spec_helper'

describe SessionsController do
  include SessionsHelper
  let!(:user) { FactoryGirl.create :user }

  describe "GET #new" do
    it "assigns @user as a new instance of User" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "assigns @user to the appropriate user" do
        post :create, user: { username: user.username, password: user.password }
        expect(assigns(:user).username).to eq(user.username)
      end

      it "sets the session[:user_id] to the logged in user's id" do
        post :create, user: { username: user.username, password: user.password }
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to the logged in user's profile page" do
        post :create, user: { username: user.username, password: user.password }
        expect(response).to redirect_to(user)
      end

      it "changes the logged_in? from false to true" do
        post :create, user: { username: user.username, password: user.password }
        expect(logged_in?).to be(true)
      end

      it "ensures that the current_user has the correct e-mail address" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password}
        expect(current_user.email).to eq(user.email)
      end
    end

    context "when invalid params are passed" do
      it "assigns 'The username or password is incorrect.' as a flash[:notice]" do
        post :create, user: { username: user.username, password: "wrong" }
        expect(flash[:notice]).to eq("The username or password is incorrect.")
      end

      it "re-renders the login page if the username or password are invalid" do
        post :create, user: { username: user.username, password: "wrong" }
        expect(response).to render_template(:new)
      end

      it "does not assign a user to the current_user" do
        post :create, user: { username: user.username, password: "wrong" }
        expect(current_user).to be(nil)
      end

      it "returns false for the logged_in? method" do
        post :create, user: { username: user.username, password: "wrong" }
        expect(logged_in?).to be(false)
      end
    end
  end


  describe "GET #logout" do
    it "removes the session user_id" do
      post :create, user: { username: user.username, password: user.password }
      get :logout
      expect(session[:user_id]).to be(nil)
    end

    it "redirects to the root route" do
      get :logout
      expect(response).to redirect_to("/")
    end
  end
end