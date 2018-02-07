class AddAttachmentPhotoToMycorrhizalFungiSample < ActiveRecord::Migration[5.1]
  def change
    add_attachment :mycorrhizal_fungi_samples, :photo
  end
end
