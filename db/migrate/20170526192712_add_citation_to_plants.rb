class AddCitationToPlants < ActiveRecord::Migration[5.0]
  def change
    add_column :plants, :citation, :text
  end
end
