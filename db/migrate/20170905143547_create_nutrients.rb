class CreateNutrients < ActiveRecord::Migration[5.1]
  def change
    create_table :nutrients do |t|
      t.string :name, null: false
      t.integer :level # ActiveRecord::Enum
      t.float :amount
      t.references :soil_sample, foreign_key: true, null: false
      t.timestamps
    end
  end
end
