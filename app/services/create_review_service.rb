class CreateReviewService
  def call
    Review.create!(book_id: 1, user: "Jenn", rating: 3, body: "Excellent Book!")
    Review.create!(book_id: 1, user: "Joe", rating: 4, body: "Boring!")
    Review.create!(book_id: 2, user: "Rick", rating: 5, body: "Amazing.")
    Review.create!(book_id: 2, user: "Earl", rating: 5, body: "I Love it!")
    Review.create!(book_id: 3, user: "Tina", rating: 4, body: "A must read!")
    Review.create!(book_id: 4, user: "Charlie", rating: 1, body: "I recommend everyone buy this!")
    Review.create!(book_id: 4, user: "Mike", rating: 4, body: "Wow.  Just.  Wow.")
  end
end
