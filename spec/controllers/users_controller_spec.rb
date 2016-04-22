require 'spec_helper'

describe UsersController do
	let!(:user) { User.create!(first_name: "Mike", last_name: "James", username: "mjames", email: "mjames@email.com", password: "password") }

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

			# Ask about testing this!
			# it "assigns session[:user_id] to the new user's id if the user is saved" do
			# 	post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password}
			# 	expect(assigns(session[:user_id])).to eq(user.id)
			# end

			it "re-renders the login page if the username or password are invalid" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, password: user.password}
				expect(response).to render_template(:show)
			end
		end

		context "when invalid params are passed" do
			it "re-renders the registration page if the e-mail is left empty" do
				post :create, user: { first_name: user.first_name, last_name: user.last_name, username: user.username, email: "", password: user.password}
				expect(response).to render_template(:new)
			end
		end
	end



end