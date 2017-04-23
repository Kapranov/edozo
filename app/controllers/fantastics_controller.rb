class FantasticsController < ApplicationController
  def index
    @fantastics = Fantastic.order("published_at DESC")
  end

  def show
    @fantastic = Fantastic.find(params[:id])
  end
end
