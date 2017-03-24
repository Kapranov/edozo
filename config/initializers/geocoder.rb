Geocoder.configure(
  timeout: 3,
  lookup: :google,
  ip_lookup: :freegeoip,
  language: :en,
  use_https: false,
  http_proxy: nil,
  https_proxy: nil,
  api_key: Rails.application.secrets.geocoder_api_key,
  units: :km,
  distances: :linear
)
