class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :common_name
      t.string :scientific_name
      t.string :habitat_type
      t.string :sunlight_tolerance

      t.timestamps
    end
  end
end
