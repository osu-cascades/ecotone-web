class Plot < ApplicationRecord
  validates :plot_id, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :elevation, presence: true
  validates :area, presence: true
  validates :location_description, presence: true
  validates :aspect, presence: true
  validates :origin, presence: true
  validates :initial_planting_date, presence: true
  validates :initial_succession, presence: true

  has_attached_file :photo, default_url: "missing.png", styles: { default: "400x400#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  belongs_to :featured_plant, class_name: 'Plant', optional: true
  has_many :biodiversity_reports

  def featured_plant_name
    featured_plant&.common_name || "Unspecified"
  end

  def to_s
    name
  end

  def name
    "Plot ##{plot_id}"
  end

end
