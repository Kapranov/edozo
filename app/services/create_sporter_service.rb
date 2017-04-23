class CreateSporterService
  def call
    100.times { Sporter.create({
      name: Faker::Name.name,
      age: rand(18..50),
      country_id: rand(1..50)
    }) }
  end
end
