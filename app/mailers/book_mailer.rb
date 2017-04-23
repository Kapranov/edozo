class BookMailer < ApplicationMailer

  def new_book(book)
    @book = book
    @greeting = "The Book Release:"

    mail to: "to@example.org", subject: @greeting
  end
end
