require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without name and content" do
    article = Article.new
    assert_not article.save
  end
end
