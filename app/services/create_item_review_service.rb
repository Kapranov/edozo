class CreateItemReviewService
  def call
    items = Item.all
    item = items.collect {|p| p.id}

    item.each do |c|
      3.times do
        ItemReview.create(item_id: c, title: Faker::Job.title, body: Faker::Lorem.sentence(3, true))
      end
    end
  end
end
