require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    assert_generates "/dashboards", controller: "dashboards", action: "index"
  end

end
