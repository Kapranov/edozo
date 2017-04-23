xml.instruct!
xml.books do
  @books.each do |book|
    xml.book do
      xml.name book.name
      xml.author book.author
      xml.price number_to_currency book.price
      xml.average_rating book.average_rating
      xml.active book.active
      xml.reviews do
        book.reviews.each do |review|
          xml.review do
            xml.user review.user
            xml.rating review.rating
            xml.body review.body
          end
        end
      end
    end
  end
end
