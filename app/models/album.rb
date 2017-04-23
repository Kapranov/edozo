class Album < ApplicationRecord
  has_many :photos, inverse_of: :album, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  accepts_nested_attributes_for :photos,
    reject_if: proc { |attributes| attributes[:description].blank? },
    allow_destroy: true
end
