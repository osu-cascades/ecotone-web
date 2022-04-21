class SpeciesVariationObservationsController < ApplicationController
  
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_species_variation_observation, only: [:show, :edit, :update, :destroy]

  def index
    @species_variation_observations = SpeciesVariationObservation.order(observed_on: :desc).page(params[:page]).includes(:plot, :plant)
  end

  def show
  end

  def new
    @species_variation_observation = SpeciesVariationObservation.new
    @plots = Plot.order(:plot_id)
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def edit
    @plots = Plot.order(:plot_id)
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def create
    @species_variation_observation = SpeciesVariationObservation.new(species_variation_observation_params)
    @species_variation_observation.user = current_user
    respond_to do |format|
      if @species_variation_observation.save
        format.html { redirect_to @species_variation_observation, flash: {success: 'Species variation observation was successfully created.' } }
        format.json { render :show, status: :created, location: @species_variation_observation }
      else
        @plots = Plot.order(:plot_id)
        @plants = Plant.order(Arel.sql('LOWER(common_name)'))
        format.html { render :new }
        format.json { render json: @species_variation_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @species_variation_observation.update(species_variation_observation_params)
        format.html { redirect_to @species_variation_observation, flash: {success: 'Species variation observation was successfully updated.' } }
        format.json { render :show, status: :ok, location: @species_variation_observation }
      else
        @plots = Plot.order(:plot_id)
        @plants = Plant.order(Arel.sql('LOWER(common_name)'))
        format.html { render :edit }
        format.json { render json: @species_variation_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @species_variation_observation.destroy
    respond_to do |format|
      format.html { redirect_to species_variation_observations_url, flash: { sucess: 'Species variation observation was successfully deleted.' } }
      format.json { head :no_content }
    end
  end

  private

    def set_species_variation_observation
      @species_variation_observation = SpeciesVariationObservation.find(params[:id])
    end

    def species_variation_observation_params
      params.require(:species_variation_observation).permit(:observed_on, :plot_id, :plant_id, :average_height, :average_width, :description, photo: [])
    end

end
