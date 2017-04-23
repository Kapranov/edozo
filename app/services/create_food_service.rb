class CreateFoodService
  def call
    10.times do
      Food.create!(name: Faker::Food.ingredient, price: Faker::Number.decimal(2))
    end
  end
end
