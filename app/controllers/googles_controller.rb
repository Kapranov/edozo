class GooglesController < ApplicationController
  helper_method :current_user

  def index
  end

  def current_user
    @current_user ||= Google.find(session[:google_id]) if session[:google_id]
  end
end
