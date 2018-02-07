class SpeciesVariationObservation < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  belongs_to :plant
end
