class PlantsController < ApplicationController
  
  before_action :set_plant, only: [:show, :edit, :update, :destroy, :download_qr]
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_required, only: [:new, :create, :edit, :update, :destroy]

  def index
    @plants = Plant.all.sort_by {|plant| plant.common_name.downcase}
  end

  def show; end

  def new
    @plant = Plant.new
  end

  def edit; end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plants_path # , {last_added_id: @plant.id }, then create view method
      flash[:success] = 'Plant was successfully created.'
    else
      render :new
    end
  end

  def update
    if @plant.update(plant_params)
      redirect_to @plant
      flash[:success] = 'Plant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
    flash[:success] = 'Plant was successfully deleted.'
  end

  def download_qr
    @qr = RQRCode::QRCode.new(plant_url(@plant), size: 10, level: :h)
    png = build_qr_code_image(@qr, 360)
    send_data(
      png,
      type: 'image/png',
      disposition: 'attachment',
      filename: "#{@plant.common_name.parameterize(separator: '-')}-qr-code.png"
    )
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:common_name, :scientific_name, :description,
     :habitat_type, :tolerance, :citation, :invasive, photo: [])
  end
  
end
