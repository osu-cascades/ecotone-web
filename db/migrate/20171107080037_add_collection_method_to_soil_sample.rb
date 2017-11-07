class AddCollectionMethodToSoilSample < ActiveRecord::Migration[5.1]
  def change
    add_column :soil_samples, :collection_method, :integer # ActiveRecord::Enum
  end
end
