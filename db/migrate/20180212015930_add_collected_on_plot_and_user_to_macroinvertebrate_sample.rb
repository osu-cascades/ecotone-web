class AddCollectedOnPlotAndUserToMacroinvertebrateSample < ActiveRecord::Migration[5.1]
  def change
    add_column :macroinvertebrate_samples, :collected_on, :date
    add_reference :macroinvertebrate_samples, :plot, foreign_key: true
    add_reference :macroinvertebrate_samples, :user, foreign_key: true

    reversible do |direction|
      direction.up do
        # Initialize new field values in existing records, using values from
        # the the associated BiodiversityReport.
        MacroinvertebrateSample.all.each do |s|
          if biodiversity_report = s.biodiversity_report
            s.collected_on = biodiversity_report.measured_on
            s.user = biodiversity_report.author
            s.plot = biodiversity_report.plot
            s.save!
          end
        end
      end
      direction.down do
        # Nothing extra. Just let the migration drop the fields.
      end
    end
  end
end
