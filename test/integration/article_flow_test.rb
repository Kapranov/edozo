require 'test_helper'

class ArticleFlowTest < ActionDispatch::IntegrationTest
  test "can see the Polymorphic Association" do
    get "/articles"
    assert_select "hr"
  end
end
