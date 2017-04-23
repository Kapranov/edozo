OmniAuth.config.logger = Rails.logger
OmniAuth.config.full_host = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    Rails.application.secrets.google_oauth2_api_key,
    Rails.application.secrets.google_oauth2_api_secret,
    {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
