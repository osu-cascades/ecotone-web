class AddMoistureToSoilSamples < ActiveRecord::Migration[5.1]
  def change
    add_column :soil_samples, :moisture, :float
  end
end
