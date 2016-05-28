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
      flash[:notice] = "The required fields can not be empty."
      render "new"
    end
  end

  def edit
    if @user = User.find_by_id(params[:id])
    else
      @user = User.new
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
    @user = User.find(params[:id])
  end

  private
  def person_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end