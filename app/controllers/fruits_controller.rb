class FruitsController < ApplicationController
  def index
    @q = Fruit.ransack(params[:q])
    @fruits = @q.result
  end
end
