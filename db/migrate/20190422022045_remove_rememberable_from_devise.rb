class RemoveRememberableFromDevise < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.rename :remember_created_at, :created_at
    end
  end
end
