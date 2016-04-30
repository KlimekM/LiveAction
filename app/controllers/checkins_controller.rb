class CheckinsController < ApplicationController
	def index
		@place = Place.find(params[:place_id])
		@checkins = @place.checkins
	end

	def new
		@place = Place.find(params[:place_id])
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
			render	"new"
		end
	end

	def show
		@place = Place.find(params[:place_id])
		@checkin = Checkin.find(params[:id])
		@user = User.find(@checkin.user_id)
	end
end