class Plot < ApplicationRecord
  validates :plot_id, presence: true
  validates_numericality_of :latitude, greater_than: 0, allow_nil: true
  validates_numericality_of :longitude, greater_than: 0, allow_nil: true
  validates_numericality_of :elevation, greater_than: 0, allow_nil: true
  validates_numericality_of :area, greater_than: 0, allow_nil: true
  validates :location_description, presence: true
  validates :aspect, presence: true
  validates :origin, presence: true
  validates :initial_planting_date, presence: true
  validates :initial_succession, presence: true

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  belongs_to :featured_plant, class_name: 'Plant', optional: true
  has_many :biodiversity_reports
  
  def featured_plant_name
    featured_plant&.common_name || "Unspecified"
  end

  def name
    "Plot ##{plot_id}"
  end

  def to_s
    name
  end

  def formatted_location_description
    remove_period(location_description.slice(0,1).capitalize + location_description.strip.slice(1..-1))
  end

  def updated_string
    updated_at&.to_formatted_s(:long)
  end 

  private

  def remove_period(str)
    if str[-1] == '.'
      str[0...-1]
    else
      str
    end
  end
end
