class CommentsController < ApplicationController
  before_action :place_does_not_exist, :checkin_does_not_exist, :comment_does_not_exist, only: :edit

  def create
    @checkin = Checkin.find(params[:checkin_id])
    @place = @checkin.place
    @comment = Comment.new(commenter_id: session[:user_id], text: params[:comment][:text])
    if @comment.save
      redirect_to [@place, @checkin]
    else
      flash[:notice] = "The comment can not be blank."
      render "edit"
    end
  end

  def edit
    if authorized(@comment.commenter.id)
    else
      redirect_to "/places", notice: "Not authorized to edit comment."
    end
  end

  def update
    @place = Place.find(params[:place_id])
    @checkin = Checkin.find(params[:checkin_id])
    @comment = Comment.find(params[:id])
    if @comment.update(text: params[:comment][:text])
      redirect_to [@place, @checkin]
    else
      flash[:notice] = "The comment can not be blank."
      render "edit"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    @checkin = Checkin.find(params[:checkin_id])
    @place = @checkin.place
    redirect_to [@place, @checkin]
  end

  private

  def place_does_not_exist
    @place = Place.find(params[:place_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/places", notice: "Place not found."
  end

  def checkin_does_not_exist
    @checkin = Checkin.find(params[:checkin_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/places", notice: "Checkin not found."
  end

  def comment_does_not_exist
    @comment = Comment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/places", notice: "Comment not found."
  end
end