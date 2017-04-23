namespace :counter_cache do
  desc 'Counter cache for Project has many tasks'
  task task_counter: :environment do
    Project.reset_column_information
    Project.find_each do |x|
      Project.reset_counters(x.id, :tasks)
    end
  end

  desc 'Counter cache for Album has many photos'
  task album_counter: :environment do
    Album.reset_column_information
    Album.find_each do |x|
      Album.reset_counters(x.id, :photos)
    end
  end

  desc 'Counter cache for Category has many products'
  task category_counter: :environment do
    Category.reset_column_information
    Category.find_each do |x|
      Category.reset_counters(x.id, :products)
    end
  end
end
