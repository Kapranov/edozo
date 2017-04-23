class TacksController < ApplicationController
  before_action :get_tick

  def show
    @tack = @tick.tacks.find(params[:id])
  end
end
