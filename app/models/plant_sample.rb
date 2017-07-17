class PlantSample < ApplicationRecord
  belongs_to :plant
  belongs_to :biodiversity_report

  has_attached_file :photo, default_url: "missing.png", styles: { default: "200x200#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  validates_numericality_of :abundance, only_integer: true, greater_than: 0
  validates_numericality_of :percent_cover, only_integer: true, greater_than: 0, less_than_or_equal_to: 100

  # source - https://www.lockyy.com/posts/rails-4/exporting-csv-files-in-rails
  def self.to_csv(attributes = column_names,
                  bd_attr = biodiversity_report.column_names,
                  plant_attr = plant.column_names)

    CSV.generate do |csv|
      header = ['Plot'] + plant_attr + bd_attr + attributes
      csv.add_row header
      all.each do |sample|
        values = []
        values << sample.biodiversity_report.plot.name
        values += sample.plant.slice(*plant_attr).values
        values += sample.biodiversity_report.slice(*bd_attr).values
        values += sample.slice(*attributes).values
        csv.add_row values
      end
    end
  end

end
