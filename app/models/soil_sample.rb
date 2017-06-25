class SoilSample < ApplicationRecord
  belongs_to :biodiversity_report
  validates_numericality_of :ph_level, greater_than_or_equal_to: 0, less_than_or_equal_to: 14
  validates_numericality_of :temperature

  def has_any_attribute_values?
    attributes.any? { |k, v| v != nil }
  end

end
