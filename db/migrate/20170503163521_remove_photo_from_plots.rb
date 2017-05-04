class RemovePhotoFromPlots < ActiveRecord::Migration[5.0]
  def change
    remove_column :plots, :photo, :string
  end
end
