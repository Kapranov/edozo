Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.log_level = :info
  config.action_controller.perform_caching = true
  config.cache_store = :redis_store, Rails.application.secrets.redis_cache, { expires_in: 90.minutes }
  config.web_console.automount = true
  config.web_console.whiny_requests = false
  config.web_console.whitelisted_ips = Rails.application.secrets.web_console_ips.to_s
  #config.web_console.whitelisted_ips = %w(127.0.0.1 192.168.2.102 159.224.174.183)
end
