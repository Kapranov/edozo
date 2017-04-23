namespace :calculate_averages do
  desc "Books called calculate_averages"
  task rating: :environment do
    books = Book.all

    books.each do |book|
      puts "Calculating average rating for #{book.name}..."
      book.update_attribute(:average_rating, book.reviews.average("rating"))
      puts "The average for #{book.name} has been updated to #{book.average_rating}"
    end
  end
end
