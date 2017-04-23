require "test_helper"

class ItemReviewTest < ActiveSupport::TestCase
  #def item_review
  #  @item_review ||= ItemReview.new
  #end

  #def test_valid
  #  assert item_review.valid?
  #end

  test "should not save item_review without title, body and item_id" do
    item = ItemReview.new
    assert_not item.save
  end
end
