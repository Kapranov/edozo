class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to dashboard_index_path
    else
      render 'new'
    end
  end

  private

  def location_params
    params.require(:location).permit(:title, :address, :user_id)
  end
end
