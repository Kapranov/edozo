Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = false

  config.action_controller.perform_caching = true
  config.cache_store = :redis_store, Rails.application.secrets.redis_cache, { expires_in: 90.minutes }

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.log_level = :info

  # config.action_mailer.preview_path = ''
  # config.action_mailer.delivery_method = Rails.application.secrets.mailcatcher_protocol
  # config.action_mailer.smtp_settings = { :address => Rails.application.secrets.mailcatcher_host, :port => Rails.application.secrets.mailcatcher_port }
  config.action_mailer.delivery_method = :"#{Rails.application.secrets.mailcatcher_protocol}"
  config.action_mailer.smtp_settings = { address: Rails.application.secrets.mailcatcher_host, port: Rails.application.secrets.mailcatcher_port }

  config.web_console.automount = true
  config.web_console.whiny_requests = false
  config.web_console.whitelisted_ips = Rails.application.secrets.web_console_ips.to_s

  config.action_mailer.default_url_options = {
    host: Rails.application.secrets.domain_name,
    port: Rails.application.secrets.port
  }

  # config.action_dispatch.tld_length = 0
end

class ActionDispatch::Request
  def location
    "159.224.174.183" # Kiev, Ukraine
    # "71.212.123.5"  # Denver,CO or Renton,WA
    # "208.87.35.103" # Nassau, Bahamas
    # "50.78.167.161" # HOL Seattle, WA
  end
end

AnyLogin.setup do |config|
  config.provider = :devise
  config.enabled = true
  config.collection_method = :all
  config.redirect_path_after_login = :new_user_session_path
  config.login_on = :both
  config.limit = :none
end
