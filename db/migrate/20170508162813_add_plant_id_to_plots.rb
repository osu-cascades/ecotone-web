class AddPlantIdToPlots < ActiveRecord::Migration[5.0]
  def change
    add_column :plots, :featured_plant_id, :integer, index: true
  end
end
