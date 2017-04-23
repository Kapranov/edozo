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
    config.middleware.use Rack::Attack
    config.middleware.insert(0, Rack::Deflater)
    config.active_job.queue_adapter = :sidekiq
    # config.autoload_paths << Rails.root.join('attachments')
    # config.middleware.use Rack::Throttle::Interval, :min => 1, :cache => Redis.new, :key_prefix => :throttle
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/attachments)
    config.autoload_paths += %W(#{config.root}/app/presenters)
    config.autoload_paths += %W(#{config.root}/app/decorators)

    config.generators do |g|
      g.factory_girl true
      # For Minitest
      # g.test_framework :minitest, spec: false, fixture: false
      # g.test_framework :minitest, spec: true
      # For RSpec
      g.test_framework :rspec, fixtures: true
      g.helper false
      g.decorator false
      g.controller assets: false
    end

    Stache.configure do |config|
      config.use :mustache
    end
  end
end
