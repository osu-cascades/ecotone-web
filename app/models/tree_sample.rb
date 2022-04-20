class TreeSample < ApplicationRecord

  enum growth_stage: { # This is more future-proof. Don't use [:composite, :point].
    seedling: 2,
    sapling: 4,
    adult: 6
  }

  belongs_to :plot
  belongs_to :plant
  belongs_to :user

  validates :collected_on, presence: true
  validates_numericality_of :tag_number, only_integer: true, greater_than: 0
  validates_presence_of :growth_stage
  validates_numericality_of :dbh, greater_than: 0
  validates_numericality_of :lower_canopy_height, greater_than: 0, allow_nil: true
  validates_numericality_of :upper_canopy_height, greater_than: 0, allow_nil: true
  validates_numericality_of :latitude, allow_nil: true
  validates_numericality_of :longitude, allow_nil: true

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  paginates_per 10

  def updated_string
    updated_at&.to_formatted_s(:long)
  end 

  def datestamp
    collected_on&.to_formatted_s(:long)
  end

  def to_s
    "#{plant} in #{plot} on #{collected_on} by #{user}"
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      header = ['Id', 'Collection Date', 'Plot', 'Species', 'Tag', 'Growth Stage', 'DBH', 'Lower Canopy Height', 'Upper Canopy Height', 'Latitude', 'Longitude']
      csv << header
      TreeSample.includes(:plot, :plant).each do |ts|
        csv.add_row [
          ts.id,
          ts.collected_on,
          ts.plot.to_s,
          ts.plant.to_s,
          ts.tag_number,
          ts.growth_stage.capitalize,
          ts.dbh,
          ts.lower_canopy_height,
          ts.upper_canopy_height,
          ts.latitude,
          ts.longitude
        ]
      end
    end
  end

end
