class RemoveBiodiversityReportFromLichenSample < ActiveRecord::Migration[5.1]
  def change
    reversible do |direction|
      direction.up do
        remove_column :lichen_samples, :biodiversity_report_id
      end

      direction.down do
        add_column :lichen_samples, :biodiversity_report_id, :integer
        LichenSample.includes(:biodiversity_reports).each do |ls|
          unless ls.biodiversity_reports.empty?
            ls.biodiversity_report_id = ls.biodiversity_reports.first.id
            ls.save!
          end
        end
      end
    end
  end
end
