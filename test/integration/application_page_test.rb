require 'test_helper'

class ApplicationPageTest < ActionDispatch::IntegrationTest
  test "must load successfully" do
    get root_path
    assert_response :success
  end

  test "navigation layout links" do
    get root_path
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "ul" do |elements|
      elements.each do |element|
        assert_select element, "li", 2
      end
    end
    assert_response :success
  end
end
