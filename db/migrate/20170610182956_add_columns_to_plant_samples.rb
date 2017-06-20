class AddColumnsToPlantSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :plant_samples, :biodiversity_report_id, :integer
    add_column :plant_samples, :plant_id, :integer
  end
end
