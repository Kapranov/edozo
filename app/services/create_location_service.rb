class CreateLocationService
  def call
    15.times do
      Location.create(address: Faker::Address.zip)
    end
  end
end
