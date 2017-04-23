class IslandsController < ApplicationController
  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)

    if @island.save
      redirect_to islands_path, notice: "The island has been successfully created."
    end
  end

  def edit
    @island = Island.find(params[:id])
  end

  def update
    @island = Island.find(params[:id])

    if @island.update_attributes(island_params)
      redirect_to islands_path, notice: "The island has been updated"
    end
  end


  def destroy
    @island = Island.find(params[:id])
    @island.destroy
  end

  private

  def island_params
    params.require(:island).permit!
  end
end

