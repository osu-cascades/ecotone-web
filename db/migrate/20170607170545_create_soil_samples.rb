class CreateSoilSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :soil_samples do |t|
      t.float :ph_level
      t.float :temperature

      t.timestamps
    end
  end
end
