class RenameBiodiversityUserToAuthor < ActiveRecord::Migration[5.1]
  def change
    rename_column :biodiversity_reports, :user_id, :author_id
  end
end
