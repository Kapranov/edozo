class Location < ApplicationRecord
  include ImageUploader[:image]
  include FloorplanUploader[:floorplan]

  attr_accessor :raw_address

  belongs_to :user, foreign_key: 'user_id'
  has_many :features, inverse_of: :location

  accepts_nested_attributes_for :features, reject_if: :all_blank, allow_destroy: true

  geocoded_by :raw_address
  reverse_geocoded_by :latitude, :longitude

  after_validation -> {
    self.address = self.raw_address
    geocode
  }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }

  after_validation :reverse_geocode, unless: ->(obj) { obj.raw_address.present? },
    if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
end
