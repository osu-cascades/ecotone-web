class PlantsController < ApplicationController

  before_action :set_plant, only: [:show, :edit, :update, :destroy, :download_qr]
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_required, only: [:new, :create, :edit, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show
  end

  def download_qr
    @qr = RQRCode::QRCode.new(plant_path(@plant), size: 10, level: :h)
    png = @qr.as_png(resize_gte_to: false,
                     resize_exactly_to: false,
                     fill: 'white',
                     color: 'black',
                     size: 360,
                     border_modules: 4,
                     module_px_size: 6,
                     file: nil)
    send_data(png, type: 'image/png', disposition: 'attachment',
              filename: "#{@plant.common_name.parameterize(separator: '-')}-qr-code.png")
  end

  def new
    @plant = Plant.new
  end

  def edit
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plants_path #, {last_added_id: @plant.id }, then create view method
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
    flash[:success] = 'Plant was successfully destroyed.'
  end

  private

    def set_plant
      @plant = Plant.find(params[:id])
    end

    def plant_params
      params.require(:plant).permit(:common_name, :scientific_name, :description, :habitat_type,
                                    :tolerance, :photo, :citation, :invasive)
    end

end
