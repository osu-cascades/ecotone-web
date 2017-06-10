class PlantSample < ApplicationRecord
  belongs_to :plant
  belongs_to :biodiversity_report, optional: true
end
