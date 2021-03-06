Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.action_controller.perform_caching = true
  config.cache_store = :redis_store, Rails.application.secrets.redis_cache, { expires_in: 90.minutes }
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.active_support.deprecation = :stderr
end
