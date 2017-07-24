class CreateFungiSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :fungi_samples do |t|
      t.string :location_within_plot
      t.float :size
      t.string :description
      t.attachment :photo

      t.timestamps
    end
  end
end
