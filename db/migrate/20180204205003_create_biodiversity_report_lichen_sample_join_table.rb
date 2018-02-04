class CreateBiodiversityReportLichenSampleJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :biodiversity_reports, :lichen_samples do |t|
      t.references :biodiversity_report, foreign_key: true, index: {name: 'index_biodiversity_reports_lichen_samples_on_bd_report_id'},
null: false
      t.references :lichen_sample, foreign_key: true, null: false
    end
    reversible do |direction|
      direction.up do
        LichenSample.all.each do |ls|
          unless ls.biodiversity_report_id.nil?
            ls.biodiversity_reports << BiodiversityReport.find(ls.biodiversity_report_id)
          end
        end
      end
      direction.down do
        # Nothing extra. Just let the migration drop the join table.
      end
    end
  end
end
