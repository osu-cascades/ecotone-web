class CreateMacroinvertebrateSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :macroinvertebrate_samples do |t|
      t.string :phylum
      t.string :location_within_plot
      t.integer :quantity
      t.string :ecosystem_service
      t.integer :biodiversity_report_id
      t.attachment :photo

      t.timestamps
    end
  end
end
