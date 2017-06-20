class SoilSample < ApplicationRecord
  belongs_to :biodiversity_report, optional: true
end
