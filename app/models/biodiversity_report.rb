class BiodiversityReport < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :plot

  has_and_belongs_to_many :soil_samples
  has_and_belongs_to_many :lichen_samples
  has_and_belongs_to_many :macroinvertebrate_samples
  has_and_belongs_to_many :plant_samples

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  validates_presence_of :measured_on
  validates_numericality_of :temperature, allow_nil: true
  validates_numericality_of :species_richness, only_integer: true, greater_than: 0
  validates_numericality_of :diversity_index, greater_than: 0
  validates_numericality_of :species_evenness, greater_than_or_equal_to: 0, less_than_or_equal_to: 1, allow_nil: true
  validates_numericality_of :biomass_estimate, greater_than_or_equal_to: 0, allow_nil: true

  paginates_per 10

  def updated_string
    updated_at&.to_formatted_s(:long)
  end 

  def datestamp
    measured_on&.to_formatted_s(:long)
  end

  def to_s
    "Biodiversity Report #{id}"
  end

  def user
    author
  end

end
