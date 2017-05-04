class AddAttachmentPhotoToPlots < ActiveRecord::Migration[5.0]
  def change
    add_attachment :plots, :photo
  end
end
