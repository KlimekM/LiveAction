class FriendshipsController < ApplicationController
  def create
    current_user = User.find_by_id(session[:user_id])
    @user = User.find_by_id(params[:id])
    current_user.friends << @user
    @user.friends << current_user
    redirect_to @user
  end

  def destroy
    current_user = User.find_by_id(session[:user_id])
    @user = User.find_by_id(params[:id])
    current_user.friends.delete(@user)
    @user.friends.delete(current_user)
    redirect_to @user
  end
end