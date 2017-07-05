class AddDiversityIndexToBiodiversityReports < ActiveRecord::Migration[5.1]
  def change
    add_column :biodiversity_reports, :diversity_index, :float
  end
end
