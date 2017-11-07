class AddSpeciesEvennessToBiodiversityReport < ActiveRecord::Migration[5.1]
  def change
    add_column :biodiversity_reports, :species_evenness, :float
  end
end
