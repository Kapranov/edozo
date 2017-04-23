class GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def edit
    @good = Good.find(params[:id])
    @statuses = Good.statuses
  end

  def update
    @good = Good.find(params[:id])
    @statuses = Good.statuses

    if @good.update_attributes(good_params)
      redirect_to goods_path, notice: "The good has been created."
    else
      render :edit
    end
  end

  private

  def good_params
    params.require(:good).permit(:subtotal, :tax, :shipping, :total, :status)
  end
end
