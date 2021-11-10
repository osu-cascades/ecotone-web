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

  has_one_attached :photo
  #has_attached_file :photo, default_url: 'missing.png', styles: { default: '400x400#', thumbnail: '50x50#' }
  #validates_attachment_content_type :photo, content_type: /\Aimage/

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
    add_period(location_description.slice(0,1).capitalize + location_description.strip.slice(1..-1))
  end

  private

  def add_period(str)
    str << '.' unless str[-1] == '.'
  end
end
