class CommentsController < ApplicationController
  def create
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @place = @checkin.place
    @comment = Comment.new(commenter_id: session[:user_id], commentable_type: "Checkin", commentable_id: @checkin.id, text: params[:comment][:text])
    if @comment.save
      redirect_to [@place, @checkin]
    else
      flash[:notice] = "The comment can not be blank."
      render "edit"
    end
  end

  def edit
    @place = Place.find_by_id(params[:place_id])
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @comment = Comment.find_by_id(params[:id])
    if @place && @checkin && @comment
    else
      @user = User.new
    end
  end

  def update
    @place = Place.find_by_id(params[:place_id])
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @comment = Comment.find_by_id(params[:id])
    if @comment.update(text: params[:comment][:text])
      redirect_to [@place, @checkin]
    else
      flash[:notice] = "The comment can not be blank."
      render "edit"
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    @checkin = Checkin.find_by_id(params[:checkin_id])
    @place = @checkin.place
    redirect_to [@place, @checkin]
  end
end