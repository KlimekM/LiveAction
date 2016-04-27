class CheckinsController < ApplicationController
	def new
		@place = Place.find(params[:place_id])
	end

	def create
	end
end