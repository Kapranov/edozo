require "test_helper"

class ItemTest < ActiveSupport::TestCase
  #def item
  #  @item ||= Item.new
  #end

  #def test_valid
  #  assert item.valid?
  #end

  test "should not save item without name vs. description" do
    item = Item.new
    assert_not item.save
  end
end
