class PlacesController < ApplicationController
  before_action :place_does_not_exist, only: :show

  def index
    @places = Place.all
  end

  def show
  end

  private

  def place_does_not_exist
    @place = Place.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/places", notice: "Place not found."
  end
end