class Plant < ApplicationRecord
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :habitat_type, presence: true
  validates :sunlight_tolerance, presence: true
end
