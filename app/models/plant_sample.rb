class PlantSample < ApplicationRecord
  belongs_to :plant
  belongs_to :biodiversity_report

  has_attached_file :photo, default_url: "missing.png", styles: { default: "200x200#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  validates_numericality_of :abundance, only_integer: true, greater_than: 0
  validates_numericality_of :percent_cover, only_integer: true, greater_than: 0
  validates_numericality_of :biomass_estimate, greater_than: 0
end
