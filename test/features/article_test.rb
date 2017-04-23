require "test_helper"

feature "Article" do
  scenario "displays a list of articles" do
    visit articles_path
    page.must_have_css("#articles")
    within("#articles") do
      Article.find_each do |article|
        selector = "#article-#{ article.id }"
        page.must_have_css(selector)
        within(selector) do
          page.must_have_content article.name
          page.must_have_content article.content
        end
      end
    end
  end
end
