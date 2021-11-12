class Plant < ApplicationRecord
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :description, presence: true
  validates :habitat_type, presence: true
  validates :tolerance, presence: true

  has_one_attached :photo
  #has_attached_file :photo, default_url: 'missing.png', styles: { default: '200x200#', thumbnail: '50x50#' }
  validates :photo, content_type: ['image/jpg', 'image/png']

  has_many :plots, foreign_key: 'featured_plant_id'
  has_many :plant_samples

  def to_s
    "#{common_name} (#{scientific_name})"
  end
end
