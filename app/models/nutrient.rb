class Nutrient < ApplicationRecord
  belongs_to :soil_sample
  enum level: { # This is more future-proof. Don't use [:low, :med, :high].
    'not present': 0, # Can't use none, since AR already has a none method.
    low: 2,
    medium: 4,
    high: 6
  }
  validates_presence_of :name
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :amount, presence: { if: -> { level.nil? } }
  validates :level, presence: { if: -> { amount.nil? } }

end
