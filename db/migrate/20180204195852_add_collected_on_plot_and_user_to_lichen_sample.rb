class AddCollectedOnPlotAndUserToLichenSample < ActiveRecord::Migration[5.1]
  def change
    add_column :lichen_samples, :collected_on, :date
    add_reference :lichen_samples, :plot, foreign_key: true
    add_reference :lichen_samples, :user, foreign_key: true

    reversible do |direction|
      direction.up do
        # Initialize new field values in existing records, using values from
        # the the associated BiodiversityReport.
        LichenSample.all.each do |ls|
          biodiversity_report = BiodiversityReport.find(ls.biodiversity_report_id)
          if biodiversity_report
            ls.collected_on = biodiversity_report.measured_on
            ls.user = biodiversity_report.author
            ls.plot = biodiversity_report.plot
            ls.save!
          end
        end
      end
      direction.down do
        # Nothing extra. Just let the migration drop the fields.
      end
    end
  end
end
