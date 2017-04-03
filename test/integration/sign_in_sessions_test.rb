require 'test_helper'

class SignInSessionsTest < ActionDispatch::IntegrationTest
  test "must load successfully" do
    get new_user_session_path
    assert_response :success
    assert_select "div.signin-container"
    assert_select "h2", "Sign in with"
  end

  test "navigation omnith select " do
    get new_user_session_path
    assert_select "a[href=?]", user_twitter_omniauth_authorize_path
    assert_select "a[href=?]", user_facebook_omniauth_authorize_path
    assert_select "a[href=?]", user_linkedin_omniauth_authorize_path
    assert_select "a[href=?]", user_google_oauth2_omniauth_authorize_path
    assert_select "a[href=?]", user_github_omniauth_authorize_path
    assert_select "a[href=?]", user_developer_omniauth_authorize_path if Rails.env.development?
  end
end
