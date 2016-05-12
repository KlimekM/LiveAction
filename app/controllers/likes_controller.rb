class LikesController < ApplicationController
  def create
    @user = User.find_by_id(session[:user_id])
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @place = @checkin.place
    @user.likes.create!(liker_id: session[:user_id], likeable_id: @checkin.id, likeable_type: "Checkin")
    redirect_to [@place, @checkin]
  end

  def destroy
    like = Like.find_by(liker_id: params[:user_id], likeable_id: params[:checkin_id])
    like.destroy
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @place = @checkin.place
    redirect_to [@place, @checkin]
  end
end