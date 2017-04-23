class SitemapController < ApplicationController
  respond_to :xml

  def index
    @books = Book.order("created_at DESC")
  end
end
