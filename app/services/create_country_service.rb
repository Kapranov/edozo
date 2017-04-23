require 'csv'

class CreateCountryService
  def call
    puts "Importing countries..."
    CSV.foreach(Rails.root.join("lib/countries.csv"), headers: true) do |row|
      Country.create! do |country|
        country.id = row[0]
        country.name = row[1]
      end
    end

    # data from gem country
    # ISO3166::Country.all.shuffle.first(50).each do |country|
    #   Country.create({name: country.name})
    # end
  end
end

