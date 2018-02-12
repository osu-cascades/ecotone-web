class CreateBiodiversityReportMacroinvertebrateSampleJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :biodiversity_reports, :macroinvertebrate_samples do |t|
      t.references :biodiversity_report, foreign_key: true, index: {name: 'index_bd_reports_macroinvertebrate_samples_on_bd_report_id'}, null: false
      t.references :macroinvertebrate_sample, foreign_key: true, index: {name: 'index_biodiversity_reports_mi_samples_on_mi_sample_id'}, null: false
    end
    reversible do |direction|
      direction.up do
        # Add each existing 1:M association to new M:N association.
        MacroinvertebrateSample.includes(:biodiversity_report).each do |s|
          unless s.biodiversity_report.nil?
            s.biodiversity_reports << s.biodiversity_report
          end
        end
      end
      direction.down do
        # Nothing extra. Just let the migration drop the join table.
      end
    end
  end
end
