class CreateItemService
  def call
    10.times do |item|
      Item.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence(3, true))
    end
  end
end
