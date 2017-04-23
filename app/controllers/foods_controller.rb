class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all.paginate(page: params[:page], per_page: 6)
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @foods = Food.all
    @food = Food.create(food_params)
  end

  def edit
  end

  def update
    @foods = Food.all
    @food.update_attributes(food_params)
  end

  def delete
    @food = Food.find(params[:food_id])
  end

  def destroy
    @foods = Food.all
    @food.destroy
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :price)
  end
end
