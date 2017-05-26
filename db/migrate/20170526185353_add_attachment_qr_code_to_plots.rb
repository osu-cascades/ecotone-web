class AddAttachmentQrCodeToPlots < ActiveRecord::Migration
  def change
    add_attachment :plots, :qr_code
    Plot.all.each do |plot|
      qrcode = RQRCode::QRCode.new(plot_path(:id))
      svg = qrcode.as_svg(offset: 0, color: '000', 
                          shape_rendering: 'crispEdges', 
                          module_size: 11)
      plot.update_attributes(:qr_code => svg)
    end
  end
end

