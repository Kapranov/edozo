class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action  :set_redis

  private

  def set_redis
    $redis.set("hello", "Application was connected to Redis!")
  end

end
