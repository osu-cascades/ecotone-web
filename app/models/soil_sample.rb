class SoilSample < ApplicationRecord

  enum collection_method: { # This is more future-proof. Don't use [:composite, :point].
    composite: 2,
    point: 4
  }

  belongs_to :plot
  belongs_to :user
  has_many :nutrients
  has_and_belongs_to_many :biodiversity_reports

  accepts_nested_attributes_for :nutrients

  validates_presence_of :collected_on
  validates_presence_of :collection_method
  validates_numericality_of :ph_level, greater_than_or_equal_to: 0, less_than_or_equal_to: 14
  validates_numericality_of :temperature
  validates_numericality_of :moisture, greater_than_or_equal_to: 0

  DEFAULT_NUTRIENT_NAMES = ['Nitrogen', 'Phosphorus', 'Potassium']

  # Associate three Nutrient models: Nitrogen, Phosphorus and Potassium
  def build_default_nutrients
    DEFAULT_NUTRIENT_NAMES.each do |name|
      nutrients.build(name: name)
    end
  end

  def to_s
    "#{plot} on #{collected_on} by #{user}"
  end

end
