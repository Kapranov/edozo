class CreateFruitService
  def call
    10.times do
      Fruit.create(name: Faker::Food.ingredient)
    end
  end
end
