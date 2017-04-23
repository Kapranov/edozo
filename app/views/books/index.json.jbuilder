json.books @books do |book|
  json.name book.name
  json.author book.author
  json.rating book.average_rating
  json.price number_to_currency book.price
  json.active book.active

  json.reviews book.reviews do |review|
    json.user review.user
    json.rating review.rating
    json.body review.body
  end
end

