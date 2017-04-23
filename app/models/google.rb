class Google < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |google|
      google.provider = auth.provider
      google.uid = auth.uid
      google.name = auth.info.name
      google.oauth_token = auth.credentials.token
      google.oauth_expires_at = Time.at(auth.credentials.expires_at)
      google.save!
    end
  end
end
