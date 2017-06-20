class AddBiodiversityReportIdToSoilSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :soil_samples, :biodiversity_report_id, :integer
  end
end
