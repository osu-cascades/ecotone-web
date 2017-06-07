class AddInvasiveToPlants < ActiveRecord::Migration[5.0]
  def change
    add_column :plants, :invasive, :boolean
  end
end
