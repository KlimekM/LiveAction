class UsersController < ApplicationController
  before_action :user_does_not_exist, only: [:edit, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(person_params)

    if @user.save
      session[:user_id] = @user.id
      render "show"
    else
      flash[:notice] = "The required fields can not be empty."
      render "new"
    end
  end

  def edit
    if authorized(@user.id)
    else
      redirect_to "/places", notice: "Not authorized to edit this account."
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(person_params)
      redirect_to @user
    else
      flash[:notice] = "The required fields can not be empty."
      render "edit"
    end
  end

  def show
  end

  private

  def user_does_not_exist
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/places", notice: "User not found."
  end

  def person_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end