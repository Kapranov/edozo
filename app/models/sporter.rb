class Sporter < ApplicationRecord
  belongs_to :country
  has_many :competition_results
end
