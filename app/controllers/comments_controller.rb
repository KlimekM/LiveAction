class CommentsController < ApplicationController
  def create
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @place = @checkin.place
    @comment = Comment.create!(commenter_id: session[:user_id], commentable_type: "Checkin", commentable_id: @checkin.id, text: params[:comment][:text])
    # change this to if @... .save, else render
    redirect_to [@place, @checkin]
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @place = @checkin.place
    redirect_to [@place, @checkin]
  end
end