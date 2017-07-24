class AddBiodiversityReportIdToFungiSamples < ActiveRecord::Migration[5.1]
  def change
    add_column :fungi_samples, :biodiversity_report_id, :integer
  end
end
