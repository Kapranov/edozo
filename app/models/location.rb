class Location < ApplicationRecord
  include ImageUploader[:image]
  include FloorplanUploader[:floorplan]

  attr_accessor :raw_address

  has_many :features,   inverse_of: :location
  has_many :photos,     inverse_of: :location
  has_many :floorplans, inverse_of: :location
  belongs_to :user,     foreign_key: 'user_id'

  accepts_nested_attributes_for :features,    reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :photos,      reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :floorplans,  reject_if: :all_blank, allow_destroy: true

  geocoded_by :raw_address
  reverse_geocoded_by :latitude, :longitude

  after_validation -> {
    self.address = self.raw_address
    geocode
  }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }

  after_validation :reverse_geocode, unless: ->(obj) { obj.raw_address.present? },
    if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
end
