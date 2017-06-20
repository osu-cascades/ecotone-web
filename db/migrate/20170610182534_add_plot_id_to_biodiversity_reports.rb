class AddPlotIdToBiodiversityReports < ActiveRecord::Migration[5.0]
  def change
    add_column :biodiversity_reports, :plot_id, :integer
  end
end
