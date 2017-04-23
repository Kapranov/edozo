Devise.setup do |config|
  config.secret_key = Rails.application.secrets.secret_key_base
  config.mailer_sender = Rails.application.secrets.mailer_default

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth, :token_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 3..8
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  User.omniauth_providers.each do |provider_name|
    if provider_name == :developer
      config.omniauth :developer
    else
      api_key = ENV["#{provider_name.upcase}_API_KEY"]
      api_secret = ENV["#{provider_name.upcase}_API_SECRET"]
      config.omniauth provider_name, api_key, api_secret
    end
  end
end
