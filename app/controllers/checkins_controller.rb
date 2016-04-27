class CheckinsController < ApplicationController
	def new
		@place = Place.find(params[:place_id])
		@checkin = Checkin.new
	end

	def create
		@place = Place.find(params[:place_id])
		@checkin = Checkin.new()
	end
end