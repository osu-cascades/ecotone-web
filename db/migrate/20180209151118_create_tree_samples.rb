class CreateTreeSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :tree_samples do |t|
      t.date :collected_on, null: false
      t.references :plot, foreign_key: true
      t.references :user, foreign_key: true
      t.references :plant, foreign_key: true
      t.integer :tag_number, null: false
      t.integer :growth_stage, null: false
      t.float :dbh, null: false
      t.float :lower_canopy_height
      t.float :upper_canopy_height
      t.float :latitude
      t.float :longitude
      t.attachment :photo

      t.timestamps
    end
  end
end
