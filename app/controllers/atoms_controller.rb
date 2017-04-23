class AtomsController < ApplicationController
  def index
    @atoms = Atom.order("created_at DESC")
  end

  def show
    @atom = Atom.find(params[:id])
    book = Book.last
    BookMailer.new_book(book).deliver
  end
end
