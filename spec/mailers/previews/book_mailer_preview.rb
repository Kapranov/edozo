# Preview all emails at http://localhost:3000/rails/mailers/book_mailer
class BookMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/book_mailer/new_book
  def new_book
    book = Book.first
    BookMailer.new_book(book)
  end

end
