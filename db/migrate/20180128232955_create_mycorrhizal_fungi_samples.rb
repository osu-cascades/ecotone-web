class CreateMycorrhizalFungiSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :mycorrhizal_fungi_samples do |t|
      t.date :collected_on, null: false
      t.integer :length, null: false
      t.integer :magnification, null: false
      t.integer :vesicle_count, null: false
      t.integer :arbuscule_count, null: false
      t.boolean :visible_hyphae, null: false
      t.integer :hyphae_coverage
      t.references :user, foreign_key: true, null: false
      t.references :plot, foreign_key: true, null: false
      t.references :plant, foreign_key: true, null: false

      t.timestamps
    end
  end
end
