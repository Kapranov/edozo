class TicksController < ApplicationController
  before_action :get_tick

  def index
    @ticks = Tick.all
  end

  def show
    @tacks = @tick.tacks
  end
end

