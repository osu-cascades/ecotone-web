# https://github.com/osu-cascades/ecotone-web/issues/121
class DropAndRecreateNonvascularPlantSamples < ActiveRecord::Migration[5.1]
  def up
    drop_table :nonvascular_plant_samples
    create_table :nonvascular_plant_samples do |t|
      t.date :collected_on, null: false
      t.references :plot, foreign_key: true, null: false
      t.string :location_within_plot, null: false
      t.string :description, null: false
      t.attachment :photo
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end

  def down
    drop_table :nonvascular_plant_samples
    create_table :nonvascular_plant_samples do |t|
      t.string :location_within_plot
      t.string :description
      t.attachment :photo
      t.integer :biodiversity_report_id
      t.timestamps
    end
  end
end
