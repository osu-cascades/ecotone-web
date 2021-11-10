#Source: https://github.com/thoughtbot/paperclip/blob/master/MIGRATING.md
namespace :organizations do
    task migrate_to_active_storage: :environment do
      Organization.where.not(logo_file_name: nil).find_each do |organization|
        # This step helps us catch any attachments we might have uploaded that
        # don't have an explicit file extension in the filename
        image = organization.logo_file_name
        ext = File.extname(image)
        image_original = CGI.unescape(image.gsub(ext, "_original#{ext}"))
  
        # this url pattern can be changed to reflect whatever service you use
        logo_url = "https://s3.amazonaws.com/xxxxx/organizations/#{organization.id}/#{image_original}"
        organization.logo.attach(io: open(logo_url),
                                     filename: organization.logo_file_name,
                                     content_type: organization.logo_content_type)
      end
    end
  end