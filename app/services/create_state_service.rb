require 'csv'

class CreateStateService
  def call
    puts "Importing states..."
    CSV.foreach(Rails.root.join("lib/states.csv"), headers: true) do |row|
      State.create! do |state|
        state.name = row[0]
        state.country_id = row[2]
      end
    end
  end
end
