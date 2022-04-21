require 'csv'

class PlantSample < ApplicationRecord
  belongs_to :plant
  belongs_to :plot
  belongs_to :user
  has_and_belongs_to_many :biodiversity_reports

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  validates_presence_of :collected_on
  validates_numericality_of :abundance, only_integer: true, greater_than: 0
  validates_numericality_of :percent_cover, only_integer: true, greater_than: 0, less_than_or_equal_to: 100
  validates_numericality_of :biomass_estimate, greater_than_or_equal_to: 0, allow_nil: true

  paginates_per 10

  # source - https://www.lockyy.com/posts/rails-4/exporting-csv-files-in-rails
  def self.to_csv(plant_sample_attributes = column_names,
                  report_attributes = biodiversity_report.column_names,
                  plant_attributes = plant.column_names)
    return 'DEPRECATED'
    CSV.generate do |csv|
      header = ['Plot'] + plant_attributes + report_attributes + plant_sample_attributes
      csv.add_row header
      all.each do |sample|
        values = []
        values << sample.biodiversity_report.plot.name
        values += sample.plant.slice(*plant_attributes).values
        values += sample.biodiversity_report.slice(*report_attributes).values
        values += sample.slice(*plant_sample_attributes).values
        csv.add_row values
      end
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

end
