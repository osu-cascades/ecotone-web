class ImageAttachmentsController < ApplicationController

  def delete
    @photo = ActiveStorage::Attachment.find(params[:id])
    @photo.purge
    redirect_back fallback_location: root_url
    flash[:success] = 'Photo was successfully deleted.'
  end
  
end