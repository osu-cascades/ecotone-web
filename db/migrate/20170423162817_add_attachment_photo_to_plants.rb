class AddAttachmentPhotoToPlants < ActiveRecord::Migration[5.0]
  def change
    add_attachment :plants, :photo
  end
end
