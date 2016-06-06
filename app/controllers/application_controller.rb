class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def authorized(creator_id)
    current_user && current_user.id == creator_id
  end
end
