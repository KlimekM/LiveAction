require 'spec_helper'

describe UsersController do
  include SessionsHelper
  let(:user) { FactoryGirl.create :user }

  describe "GET #new" do
    it "assigns @user as a new instance of User" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "assigns @user as an instance of User" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password }
        expect(assigns(:user)).to be_a(User)
      end

      it "re-renders the login page if the username or password are invalid" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password }
        expect(response).to render_template(:show)
      end

      it "ensures that the current_user has the correct e-mail address" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password }
        expect(current_user.email).to eq(user.email)
      end

      it "changes the logged_in? from false to true" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password }
        expect(logged_in?).to be(true)
      end
    end

    context "when invalid params are passed" do
      it "re-renders the registration page if the e-mail is left empty" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: "", password: user.password }
        expect(response).to render_template(:new)
      end

      it "does not assign a user to the current_user" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: "", password: user.password }
        expect(current_user).to be(nil)
      end

      it "returns false for the logged_in? method" do
        post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: "", password: user.password }
        expect(logged_in?).to be(false)
      end
    end
  end

  describe "GET #edit" do
    context "when the user attempting to edit the profile is authorized" do
      it "assigns @user to the correct instance of User" do
        get :edit, id: user.id
        expect(assigns(:user).id).to eq(user.id)
      end

      it "verifies that the current_user id is equal to the user id" do
        simulate_login
        get :edit, id: user.id
        expect(assigns(:user).id).to eq(current_user.id)
      end
    end

    context "when a user attempts to edit a profile that is not their own" do
      let(:user_two) { FactoryGirl.create :user }
      it "assigns 'Not authorized to edit account.' as a flash[:notice]" do
        simulate_login
        get :edit, id: user_two.id
        expect(flash[:notice]).to eq("Not authorized to edit account.")
      end

      it "redirects to the places index page" do
        simulate_login
        get :edit, id: user_two.id
        expect(response).to redirect_to("/places")
      end
    end
  end

  describe "PUT #update" do
    context "when valid params are passed" do
      it "assigns @user as the correct instance of User" do
        new_last_name = Faker::Name.last_name
        get :edit, id: user.id
        put :update, id: user.id, user: {last_name: new_last_name }
        expect(assigns(:user).id).to eq(user.id)
      end

      it "changes the last name of the user to new_last_name" do
        new_last_name = Faker::Name.last_name
        get :edit, id: user.id
        put :update, id: user.id, user: {last_name: new_last_name }
        expect(assigns(:user).last_name).to eq(new_last_name)
      end

      it "redirects to the appropriate user" do
        new_last_name = Faker::Name.last_name
        get :edit, id: user.id
        put :update, id: user.id, user: {last_name: new_last_name }
        expect(response).to redirect_to(user)
      end
    end

    context "when invalid params are passed" do
      it "assigns 'The required fields can not be empty.' to flash[:notice]" do
        get :edit, id: user.id
        put :update, id: user.id, user: { username: "" }
        expect(flash[:notice]).to eq("The required fields can not be empty.")
      end

      it "re-renders the user edit page" do
        get :edit, id: user.id
        put :update, id: user.id, user: { username: "" }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "GET #show" do
    context "when a user exists" do
      it "assigns @user as an instance of User" do
        get :show, id: user.id
        expect(assigns(:user)).to be_a(User)
      end

      it "ensures @user has the correct id" do
        get :show, id: user.id
        expect(assigns(:user).id).to eq(user.id)
      end
    end

    context "when a user does not exist" do
      it "assigns 'User not found.' to flash[:notice]" do
        get :show, id: 50000
        expect(flash[:notice]).to eq("User not found.")
      end

      it "redirects to the places index page" do
        get :show, id: 50000
        expect(response).to redirect_to("/places")
      end
    end
  end
end