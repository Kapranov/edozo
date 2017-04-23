class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  after_action  :set_online
  before_action :detect_browser

  def location
    if Rails.env.development?
      Geocoder.search(request.location).first
    else
      request.location
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || dashboards_path
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private

  def set_online
    # byebug
    Rails.logger.info "\n\t***********************************\n\tApplication was connected to Redis!\n\t***********************************\n"
    $redis.set("hello", "Application was connected to Redis!")
  end

  def detect_browser
    case request.user_agent
      when /iPad/i
        request.variant = :tablet
      when /iPhone/i
        request.variant = :phone
      when /Android/i && /mobile/i
        request.variant = :phone
      when /Android/i
        request.variant = :tablet
      when /Windows Phone/i
        request.variant = :phone
      else
        request.variant = :desktop
    end
  end

  def get_tick
    ticks = Tick.where(subdomain: request.subdomain)

    if ticks.count > 0
      @tick = ticks.first
    elsif request.subdomain != 'www'
      redirect_to root_url(subdomain: 'www')
    end
  end
end
