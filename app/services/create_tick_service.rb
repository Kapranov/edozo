class CreateTickService
  def call
    #Tick.create!(name: "My Example Blog", subdomain: "example")
    #Tick.create!(name: "Awesome Blog", subdomain: "awesome")
    10.times do
      Tick.create!(name: Faker::Name.title, subdomain: Faker::Name.last_name.downcase)
    end
  end
end
