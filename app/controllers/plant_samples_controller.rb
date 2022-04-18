class PlantSamplesController < ApplicationController
  
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_plant_sample, only: [:show, :edit, :update, :destroy]

  def index
    @plant_samples = PlantSample.order(collected_on: :desc).page(params[:page])
  end

  def export
    @data = PlantSample.all
    plant_sample_attributes = %w[abundance percent_cover]
    bd_attributes = %w[measured_on measured_at temperature species_richness diversity_index]
    plant_attributes = %w[common_name scientific_name]
    respond_to do |format|
      format.html
      format.csv { send_data @data.to_csv(plant_sample_attributes, bd_attributes, plant_attributes) }
    end
  end

  def show; end

  def new
    @plant_sample = PlantSample.new
    @plots = Plot.order(:plot_id)
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def edit
    @plots = Plot.order(:plot_id)
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def create
    @plant_sample = PlantSample.new(plant_sample_params)
    @plant_sample.user = current_user
    if @plant_sample.save
      redirect_to plant_samples_path
      flash[:success] = 'Plant sample was successfully created.'
    else
      @plots = Plot.order(:plot_id)
      @plants = Plant.order(Arel.sql('LOWER(common_name)'))
      render :new
    end
  end

  def update
    if @plant_sample.update(plant_sample_params)
      redirect_to @plant_sample
      flash[:success] = 'Plant sample was successfully updated.'
    else
      @plots = Plot.order(:plot_id)
      @plants = Plant.order(Arel.sql('LOWER(common_name)'))
      render :edit
    end
  end

  def destroy
    @plant_sample.destroy
    redirect_to plant_samples_path
    flash[:success] = 'Plant sample was successfully deleted.'
  end

  private

    def set_plant_sample
      @plant_sample = PlantSample.find(params[:id])
    end

    def plant_sample_params
      params.require(:plant_sample).permit(:collected_on, :abundance, :percent_cover, :biomass_estimate,
        :plant_id, :plot_id, photo: [])
    end

end
