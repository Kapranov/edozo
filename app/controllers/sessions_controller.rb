class SessionsController < ApplicationController
  def create
    google = Google.from_omniauth(env["omniauth.auth"])
    session[:google_id] = google.id
    redirect_to root_path
  end

  def destroy
    session[:google_id] = nil
    redirect_to root_path
  end
end
