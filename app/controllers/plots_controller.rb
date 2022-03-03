class PlotsController < ApplicationController
  before_action :set_plot, only: [:show, :edit, :update, :destroy, :download_qr]
  before_action :login_required, except: [:index, :show, :download_qr]
  before_action :admin_required, except: [:index, :show, :download_qr]
  before_action :redirect_cancel_new, :only => [:create]
  before_action :redirect_cancel_edit, :only => [:update]


  def index
    @plots = Plot.order(:plot_id)
  end

  def map
    @plots = Plot.all
  end;

  def show; 
  end

  def new
    @plot = Plot.new
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def edit
    @plants = Plant.all
  end

  def create
    @plot = Plot.new(plot_params)
    if @plot.save
      redirect_to plots_path
      flash[:success] = 'Plot was successfully created.'
    else
      @plants = Plant.all
      render 'new'
    end
  end

  def update
    if @plot.update(plot_params)
      redirect_to @plot
      flash[:success] = 'Plot was successfully updated.'
    else
      @plants = Plant.all
      render 'edit'
    end
  end

  def redirect_cancel_new
    redirect_to plots_path if params[:cancel]
  end

  def redirect_cancel_edit
    redirect_to @plot if params[:cancel]
  end

  def delete_image_attachment
    @photo = ActiveStorage::Attachment.find(params[:id])
    @photo.purge
    redirect_back fallback_location: @plot
    flash[:success] = 'Photo was successfully deleted.'
  end

  def destroy
    @plot.destroy
    redirect_to plots_path
    flash[:success] = 'Plot was successfully deleted.'
  end

  def download_qr
    @qr = RQRCode::QRCode.new(plot_url(@plot), size: 10, level: :h)
    png = build_qr_code_image(@qr, 360)
    send_data(
      png,
      type: 'image/png',
      disposition: 'attachment',
      filename: "plot-#{@plot.plot_id}-qr-code.png"
    )
  end

  private

  def set_plot
    @plot = Plot.find(params[:id])
  end

  def plot_params
    params.require(:plot).permit(:plot_id, :featured_plant_id, :latitude, :longitude,
      :elevation, :area, :location_description, :aspect, :origin, :inoculated,
      :initial_planting_date, :initial_succession, photo: [])
  end
end
