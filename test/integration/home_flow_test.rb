require 'test_helper'

class HomeFlowTest < ActionDispatch::IntegrationTest
  test "can see h1 demo" do
    get "/"
    assert_select "h1", "Application Demos detect the device type on page load for multiple devices"
  end
end
