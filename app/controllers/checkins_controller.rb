class CheckinsController < ApplicationController
  def index
    @place = Place.find_by_id(params[:place_id])
    if @place
      @checkins = @place.checkins
    else
      flash[:notice] = "The place that you requested does not exist."
    end
  end

  def new
    @place = Place.find_by_id(params[:place_id])
    if @place
      @checkin = Checkin.new
    else
      flash[:notice] = "The place that you requested does not exist."
    end
  end

  def create
    @place = Place.find(params[:place_id])
    @checkin = Checkin.new(description: params[:checkin][:description], place_id: @place.id, date_attended: Checkin.convert_to_date(params[:checkin]))
    @user = User.find(session[:user_id])
    @user.checkins << @checkin
    @checkins = @place.checkins

    if @checkin.save
      render "index"
    else
      flash[:notice] = "There was an error creating the checkin. Please try again."
      render  "new"
    end
  end

  def edit
    @user = User.find_by_id(session[:user_id])
    @place = Place.find_by_id(params[:place_id])
    @checkin = Checkin.find_by_id(params[:id])
    if @place && @checkin
    else
      @user = User.new
    end
  end

  def update
    @place = Place.find(params[:place_id])
    @checkin = Checkin.find(params[:id])
    if @checkin.update(description: params[:checkin][:description], place_id: @place.id, date_attended: Checkin.convert_to_date(params[:checkin]))
      redirect_to [@place, @checkin]
    else
      flash[:notice] = "The checkin failed to update."
      render "edit"
    end
  end

  def show
    @comment = Comment.new
    @place = Place.find_by_id(params[:place_id])
    @checkin = Checkin.find_by_id(params[:id])
    if @place && @checkin
      @user = User.find_by_id(@checkin.user_id)
    else
      flash[:notice] = "The place or checkin that you requested does not exist."
    end
  end

  def destroy
  end
end