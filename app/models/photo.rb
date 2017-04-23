class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :album, inverse_of: :photos, counter_cache: true
  has_many :comments, dependent: :destroy
end
