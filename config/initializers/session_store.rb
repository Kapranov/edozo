# Rails.application.config.session_store :cookie_store, key: '_edozo_session'
Rails.application.config.session_store :redis_store, servers: [Rails.application.secrets.redis_data]
