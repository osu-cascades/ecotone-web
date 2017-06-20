class CreatePlantSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :plant_samples do |t|
      t.integer :abundance
      t.integer :percent_cover
      t.float :biomass_estimate
      t.attachment :photo

      t.timestamps
    end
  end
end
