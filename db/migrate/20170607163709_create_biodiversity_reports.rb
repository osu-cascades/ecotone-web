class CreateBiodiversityReports < ActiveRecord::Migration[5.0]
  def change
    create_table :biodiversity_reports do |t|
      t.date :date
      t.time :time
      t.float :temperature
      t.float :biomass_estimate
      t.integer :species_richness
      t.attachment :photo

      t.timestamps
    end
  end
end
