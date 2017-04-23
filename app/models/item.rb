class Item < ApplicationRecord
  has_many :item_reviews
  validates :name, presence: true
end
