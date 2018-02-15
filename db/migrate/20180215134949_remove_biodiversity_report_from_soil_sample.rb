class RemoveBiodiversityReportFromSoilSample < ActiveRecord::Migration[5.1]
  def change
    reversible do |direction|
      direction.up do
        remove_column :soil_samples, :biodiversity_report_id
      end

      direction.down do
        add_column :soil_samples, :biodiversity_report_id, :integer
        SoilSample.includes(:biodiversity_reports).each do |s|
          unless s.biodiversity_reports.empty?
            s.biodiversity_report_id = s.biodiversity_reports.first.id
            s.save!
          end
        end
      end
    end
  end
end
