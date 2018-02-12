class RemoveBiodiversityReportFromMacroinvertebrateSample < ActiveRecord::Migration[5.1]
  def change
    reversible do |direction|
      direction.up do
        remove_column :macroinvertebrate_samples, :biodiversity_report_id
      end

      direction.down do
        add_column :macroinvertebrate_samples, :biodiversity_report_id, :integer
        MacroinvertebrateSample.includes(:biodiversity_reports).each do |s|
          unless s.biodiversity_reports.empty?
            s.biodiversity_report_id = s.biodiversity_reports.first.id
            s.save!
          end
        end
      end
    end
  end
end
