class CreatePlots < ActiveRecord::Migration[5.0]
  def change
    create_table :plots do |t|
      t.integer :plot_id
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.float :area
      t.text :location_description
      t.string :aspect
      t.string :origin
      t.boolean :inoculated
      t.string :initial_planting_date
      t.string :initial_succession
      t.string :photo

      t.timestamps
    end
  end
end
