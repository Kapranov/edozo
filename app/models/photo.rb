class Photo < ApplicationRecord
  belongs_to :location

  include ImageUploader[:image]
end
