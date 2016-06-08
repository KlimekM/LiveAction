class CheckinsController < ApplicationController
  before_action :place_does_not_exist, only: [:index, :new, :edit, :show]
  before_action :checkin_does_not_exist, only: [:edit, :show]

  def index
    @checkins = @place.checkins
  end

  def new
    @checkin = Checkin.new
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
      flash[:notice] = "The checkin date can not be in the future."
      render  "new"
    end
  end

  def edit
    if authorized(@checkin.user.id) && @checkin.place.id == @place.id
    else
      redirect_to "/places", notice: "Not authorized to edit this checkin."
    end
  end

  def update
    @place = Place.find(params[:place_id])
    @checkin = Checkin.find(params[:id])
    if @checkin.update(description: params[:checkin][:description], place_id: @place.id, date_attended: Checkin.convert_to_date(params[:checkin]))
      redirect_to [@place, @checkin]
    else
      flash[:notice] = "The checkin date can not be in the future."
      render "edit"
    end
  end

  def show
    @comment = Comment.new
    @user = User.find(@checkin.user_id)
    if @place.id == @checkin.place.id
    else
      redirect_to "/places", notice: "Checkin not found."
    end
  end

  def destroy
    @checkin = Checkin.find(params[:id])
    @checkin.destroy
    @place = @checkin.place
    redirect_to place_checkins_path(@place)
  end

  private

    def place_does_not_exist
      @place = Place.find(params[:place_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/places", notice: "Place not found."
    end

    def checkin_does_not_exist
      @checkin = Checkin.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/places", notice: "Checkin not found."
    end
end