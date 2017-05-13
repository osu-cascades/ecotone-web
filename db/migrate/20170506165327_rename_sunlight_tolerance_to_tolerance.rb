class RenameSunlightToleranceToTolerance < ActiveRecord::Migration[5.0]
  def change
    rename_column :plants, :sunlight_tolerance, :tolerance
  end
end
