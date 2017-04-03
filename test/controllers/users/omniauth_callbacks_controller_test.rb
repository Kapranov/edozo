require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  test '#signup_success facebook' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uuid: '123451234512345',
      info: { email: 'testuser@testmail.com' }
    })

    get user_facebook_omniauth_authorize_path
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    get user_facebook_omniauth_callback_path
  end

  test '#signup_success twitter' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uuid: '123451234512345',
      info: { email: 'testuser@testmail.com' }
    })

    get user_twitter_omniauth_authorize_path
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    get user_twitter_omniauth_callback_path
  end

  test '#signup_success google' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google',
      uuid: '123451234512345',
      info: { email: 'testuser@testmail.com' }
    })

    get user_google_oauth2_omniauth_authorize_path
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    get user_google_oauth2_omniauth_callback_path
  end

  test '#signup_success linkedin' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
      provider: 'linkedin',
      uuid: '123451234512345',
      info: { email: 'testuser@testmail.com' }
    })

    get user_linkedin_omniauth_authorize_path
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
    get user_linkedin_omniauth_callback_path
  end

  test '#signup_success github' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uuid: '123451234512345',
      info: { email: 'testuser@testmail.com' }
    })

    get user_github_omniauth_authorize_path
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get user_github_omniauth_callback_path
  end

  test '#signup_success developer' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:developer] = OmniAuth::AuthHash.new({
      provider: 'developer',
      uuid: '123451234512345',
      info: { email: 'testuser@testmail.com' }
    })

    get user_developer_omniauth_authorize_path if Rails.env.development?
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:developer] if Rails.env.development?
    get user_developer_omniauth_callback_path if Rails.env.development?
  end
end
