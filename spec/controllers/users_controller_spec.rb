require 'spec_helper'

describe UsersController do
	include SessionsHelper
	let!(:user) { User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password) }

	describe "GET #new" do
		it "assigns @user as a new instance of User" do
			get :new
			expect(assigns(:user)).to be_a(User)
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
			it "assigns @user as an instance of User" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password}
				expect(assigns(:user)).to be_a(User)
			end

			it "re-renders the login page if the username or password are invalid" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password}
				expect(response).to render_template(:show)
			end

			it "ensures that the current_user has the correct e-mail address" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password}
				expect(current_user.email).to eq(user.email)
			end

			it "changes the logged_in? from false to true" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password}
				expect(logged_in?).to be(true)
			end
		end

		context "when invalid params are passed" do
			it "re-renders the registration page if the e-mail is left empty" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: "", password: user.password}
				expect(response).to render_template(:new)
			end

			it "does not assign a user to the current_user" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: "", password: user.password}
				expect(current_user).to be(nil)
			end

			it "returns false for the logged_in? method" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: "", password: user.password}
				expect(logged_in?).to be(false)
			end
		end
	end



end