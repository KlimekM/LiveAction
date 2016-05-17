class CommentsController < ApplicationController
  def create
    @checkin = Checkin.find_by_id(params[:checkin_id])
    redirect_to @checkin
  end
end