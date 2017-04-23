class Article < ApplicationRecord
  has_many :comments, as: :commentable

  validates :name, :content, presence: true
end
