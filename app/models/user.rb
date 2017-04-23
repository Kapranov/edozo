class User < ApplicationRecord
  devise :rememberable, :trackable, :omniauthable,
    :omniauth_providers => [:twitter, :facebook, :linkedin, :google_oauth2, :github,
                            *(:developer if Rails.env.development?)]
  has_many :dashboards

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end

  validates :provider, presence: true, length: { maximum: 9 },
    inclusion: { in: %w(Facebook LinkedIn Twitter Google Github Developer),
                 message: "Your Provider Name is not a valid" }, allow_nil: true

  validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
end
