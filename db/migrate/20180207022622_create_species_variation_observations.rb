class CreateSpeciesVariationObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :species_variation_observations do |t|
      t.date :observed_on, null: false
      t.references :user, foreign_key: true, null: false
      t.references :plot, foreign_key: true, null: false
      t.references :plant, foreign_key: true, null: false
      t.float :average_height, null: false
      t.float :average_width, null: false
      t.string :description
      t.attachment :photo

      t.timestamps
    end
  end
end
