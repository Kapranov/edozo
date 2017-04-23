class CreateBookService
  def call
    Book.create!(name: "The Goldfinch", author: "Donna Tartt", average_rating: 0.00, price: 29.95, active: true)
    Book.create!(name: "Humans of New York", author: "Brandon Stanton", average_rating: 0.00, price: 19.95, active: true)
    Book.create!(name: "Thank You for Your Service", author: "David Finkel", average_rating: 0.00, price: 18.95, active: true)
    Book.create!(name: "The Night Guest:  A Novel", author: "Fiona McFarlane", average_rating: 0.00, price: 16.95, active: true)
  end
end

