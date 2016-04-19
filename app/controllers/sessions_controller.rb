class SessionsController < ApplicationController
	def new
    @user = User.new
  end

  def create
  	if @user = User.find_by(username: session_params[:username]).try(:authenticate, session_params[:password])
  		session[:user_id] = @user.id
      redirect_to @user
    else
    	flash[:notice] = "The username or password is incorrect."
    	render "new"
  	end
  end

	def logout
		reset_session
    redirect_to '/'
	end

	private
     def session_params
      params.require(:user).permit(:username, :password)
    end
end