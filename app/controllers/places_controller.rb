class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by_id(params[:id])
    if @place
    else
      flash[:notice] = "The place that you requested does not exist."
    end
  end
end