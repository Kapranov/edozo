class Floorplan < ApplicationRecord
  belongs_to :location

  include FloorplanUploader[:image]
end
