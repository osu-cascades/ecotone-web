class AddCollectedOnPlotAndUserToSoilSample < ActiveRecord::Migration[5.1]
  def change
    add_column :soil_samples, :collected_on, :date
    add_reference :soil_samples, :plot, foreign_key: true
    add_reference :soil_samples, :user, foreign_key: true

    reversible do |direction|
      direction.up do
        # Initialize new field values in existing records, using values from
        # the the associated BiodiversityReport.
        SoilSample.all.each do |s|
          if biodiversity_report = s.biodiversity_report
            s.collected_on = biodiversity_report.measured_on
            s.user = biodiversity_report.author
            s.plot = biodiversity_report.plot
            # Necessary, as this column and it's validation were added after the
            # existing 'point' soil samples were entered. In retrospect, the migration
            # that added this column should have set this value on existing records.
            s.collection_method = 'point'
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
