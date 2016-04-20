require 'spec_helper'

describe UsersController do
	describe "GET #new" do
		it "assigns @user as a new instance of User" do
			get :new 
			expect(assigns(:user)).to be_a(User)
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
			
		end
	end



end