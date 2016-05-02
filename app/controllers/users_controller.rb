class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(person_params)

    if @user.save
      session[:user_id] = @user.id
      render "show"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def person_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end