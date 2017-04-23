class ShoppingsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 2)
    @order_item = current_order.order_items.new
  end
end
