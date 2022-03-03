class Plant < ApplicationRecord
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :description, presence: true
  validates :habitat_type, presence: true
  validates :tolerance, presence: true

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  has_many :plots, foreign_key: 'featured_plant_id'
  has_many :plant_samples

  def to_s
    "#{common_name} (#{scientific_name})"
  end

  def form_common_name
    common_name.titleize
  end
end
