class ItemReview < ApplicationRecord
  belongs_to :item
  validates :item, presence: true
  validates :title, :body, presence: true
end
