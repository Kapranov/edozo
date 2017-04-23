class ClickTracksController < ApplicationController
  def index
    @track = Track.find_by(id: params[:track_id])
  end
end
