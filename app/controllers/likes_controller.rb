class LikesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @checkin = Checkin.find(params[:checkin_id])
    @place = @checkin.place
    @user.likes.create!(liker_id: session[:user_id], checkin_id: @checkin.id)
    redirect_to [@place, @checkin]
  end

  def destroy
    like = Like.find_by(liker_id: params[:user_id], checkin_id: params[:checkin_id])
    like.destroy
    @checkin = Checkin.find(params[:checkin_id])
    @place = @checkin.place
    redirect_to [@place, @checkin]
  end
end