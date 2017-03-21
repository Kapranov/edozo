require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Edozo
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'
    config.exceptions_app = self.routes
    config.middleware.use Rack::Throttle::Interval, :min => 3.0, :cache => Redis.new, :key_prefix => :throttle
    config.middleware.use Rack::Attack
    config.middleware.insert(0, Rack::Deflater)
  end
end
