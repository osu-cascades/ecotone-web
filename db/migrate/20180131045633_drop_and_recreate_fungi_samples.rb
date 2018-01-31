# See https://github.com/osu-cascades/ecotone-web/issues/119.
class DropAndRecreateFungiSamples < ActiveRecord::Migration[5.1]
  def up
    drop_table :fungi_samples
    create_table :fungi_samples do |t|
      t.date :collected_on, null: false
      t.references :plot, foreign_key: true, null: false
      t.string :location_within_plot, null: false
      t.float :size, null: false
      t.string :description, null: false
      t.attachment :photo
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end

  def down
    drop_table :fungi_samples
    create_table :fungi_samples do |t|
      t.string :location_within_plot
      t.float :size
      t.string :description
      t.attachment :photo
      t.timestamps
      t.integer :biodiversity_report_id
    end
  end
end
