class Country < ApplicationRecord
  has_many :states
  has_many :people
  has_many :sporters
  has_many :competition_results
  has_many :competitions, through: :competition_results
end
