require 'spec_helper'

describe SessionsController do
	let!(:user) { User.create!(first_name: "Mike", last_name: "James", username: "mjames", email: "mjames@email.com", password: "password") }

	def create_session
		post :create, :user { username: user.username, password: user.password }
	end

	def create_error_session
		post :create, user: { username: user.username, password: "1234" }
	end

	describe "GET #new" do
		it "assigns @user as a new instance of User" do
			get :new 
			expect(assigns(:user)).to be_a(User)
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
			it "assigns @user to the appropriate user" do

			end
		end
	end
end