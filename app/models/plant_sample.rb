class PlantSample < ApplicationRecord
  belongs_to :plant
  belongs_to :biodiversity_report

  has_attached_file :photo, default_url: "missing.png", styles: { default: "200x200#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/
end
