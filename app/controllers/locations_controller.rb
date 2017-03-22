class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = current_user.locations.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.new(location_params)

    if @location.save
      redirect_to locations_path
    else
      render 'new'
    end
  end

  private

  def location_params
    params.require(:location).permit(:raw_address, :latitude, :longitude, :user_id)
  end
end
