class CreateLichenSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :lichen_samples do |t|
      t.string :location_within_plot
      t.string :description
      t.attachment :photo
      t.integer :biodiversity_report_id

      t.timestamps
    end
  end
end
