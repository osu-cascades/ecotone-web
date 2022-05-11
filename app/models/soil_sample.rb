class SoilSample < ApplicationRecord

  enum collection_method: { # This is more future-proof. Don't use [:composite, :point].
    composite: 2,
    point: 4
  }

  belongs_to :plot
  belongs_to :user
  has_many :nutrients, dependent: :destroy
  has_and_belongs_to_many :biodiversity_reports

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  accepts_nested_attributes_for :nutrients, reject_if: :nutrient_presence_unspecified

  validates_presence_of :collected_on
  validates_presence_of :collection_method
  validates_numericality_of :ph_level, greater_than_or_equal_to: 0, less_than_or_equal_to: 14
  validates_numericality_of :temperature
  validates_numericality_of :moisture, greater_than_or_equal_to: 0
  validate :all_nutrients_selected
  validate :level_and_amount_selected

  paginates_per 10

  DEFAULT_NUTRIENT_NAMES = ['Nitrogen', 'Phosphorus', 'Potassium']

  # Associate three Nutrient models: Nitrogen, Phosphorus and Potassium
  def build_default_nutrients(current_nutrients)
    DEFAULT_NUTRIENT_NAMES.each do |name|
      nutrients.build(name: name) unless current_nutrients.include? name
    end
  end

  def updated_string
    updated_at&.to_formatted_s(:long)
  end 

  def datestamp
    collected_on&.to_formatted_s(:long)
  end

  def to_s
    "#{plot} on #{collected_on} by #{user}"
  end

  private
  def all_nutrients_selected
    if nutrients.length() < 3 && nutrients.length > 0 
       errors.add(:nutrients, "must all have values")
    end
  end

  def level_and_amount_selected
    if nutrients.length > 0
      nutrients.each do |nutrient|
        if nutrient.level.blank? || nutrient.amount.blank? 
          errors.add(:nutrients, "must have both a level and an amount")
        end
      end
    end
  end

  def nutrient_presence_unspecified(attributes)
    attributes['level'].blank? && attributes['amount'].blank?
  end

end
