class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(allowed_params)

    if @location.save
      redirect_to @location, :notice => "Successfully created location."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update_attributes(allowed_params)
      redirect_to @location, :notice  => "Successfully updated location."
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def allowed_params
    params.require(:location).permit(:id, :address, :latitude, :longitude)
  end
end
