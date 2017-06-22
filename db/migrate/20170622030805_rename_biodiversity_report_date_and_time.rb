class RenameBiodiversityReportDateAndTime < ActiveRecord::Migration[5.1]
  def change
    rename_column :biodiversity_reports, :date, :measured_on
    rename_column :biodiversity_reports, :time, :measured_at
  end
end
