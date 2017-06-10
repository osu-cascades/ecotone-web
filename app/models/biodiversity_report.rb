class BiodiversityReport < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :plot, optional: true
  
  has_many :plant_samples
  accepts_nested_attributes_for :plant_samples

  has_one :soil_sample, through: :plot
  accepts_nested_attributes_for :soil_sample

  has_attached_file :photo, default_url: "missing.png", styles: { default: "400x400#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/
end

