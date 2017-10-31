class SoilSample < ApplicationRecord
  belongs_to :biodiversity_report
  has_many :nutrients
  validates_numericality_of :ph_level, greater_than_or_equal_to: 0, less_than_or_equal_to: 14
  validates_numericality_of :temperature
  validates_numericality_of :moisture, greater_than_or_equal_to: 0

  ignores_present_attributes exclude: 'biodiversity_report_id'

  DEFAULT_NUTRIENT_NAMES = ['Nitrogen', 'Phosphorus', 'Potassium']

  # Associate three Nutrient models: Nitrogen, Phosphorus and Potassium
  def build_default_nutrients
    DEFAULT_NUTRIENT_NAMES.each do |name|
      nutrients.build(name: name)
    end
  end
end
