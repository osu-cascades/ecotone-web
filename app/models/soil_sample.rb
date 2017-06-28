class SoilSample < ApplicationRecord
  belongs_to :biodiversity_report
  validates_numericality_of :ph_level, greater_than_or_equal_to: 0, less_than_or_equal_to: 14
  validates_numericality_of :temperature

  def has_temperature_or_ph_level?
    ph_level.present? || temperature.present?
  end

end
