class BooksController < ApplicationController
  def index
    @books = Book.all
    book = Book.last
    BookMailer.new_book(book).deliver
  end
end
