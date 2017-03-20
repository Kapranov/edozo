class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::RedisStore.new(Rails.application.secrets.redis_cache, { expires_in: 480.minutes })

  safelist('allow-localhost') do |req|
    Rails.application.secrets.localhost == req.ip || '::1' == req.ip
  end

  throttle('req/ip', limit: 5, period: 5) do |req|
    req.ip unless req.path.starts_with?('/assets')
  end
end


