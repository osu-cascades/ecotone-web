class SpeciesVariationObservationsController < ApplicationController
  before_action :set_species_variation_observation, only: [:show, :edit, :update, :destroy]

  # GET /species_variation_observations
  # GET /species_variation_observations.json
  def index
    @species_variation_observations = SpeciesVariationObservation.all
  end

  # GET /species_variation_observations/1
  # GET /species_variation_observations/1.json
  def show
  end

  # GET /species_variation_observations/new
  def new
    @species_variation_observation = SpeciesVariationObservation.new
  end

  # GET /species_variation_observations/1/edit
  def edit
  end

  # POST /species_variation_observations
  # POST /species_variation_observations.json
  def create
    @species_variation_observation = SpeciesVariationObservation.new(species_variation_observation_params)

    respond_to do |format|
      if @species_variation_observation.save
        format.html { redirect_to @species_variation_observation, notice: 'Species variation observation was successfully created.' }
        format.json { render :show, status: :created, location: @species_variation_observation }
      else
        format.html { render :new }
        format.json { render json: @species_variation_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species_variation_observations/1
  # PATCH/PUT /species_variation_observations/1.json
  def update
    respond_to do |format|
      if @species_variation_observation.update(species_variation_observation_params)
        format.html { redirect_to @species_variation_observation, notice: 'Species variation observation was successfully updated.' }
        format.json { render :show, status: :ok, location: @species_variation_observation }
      else
        format.html { render :edit }
        format.json { render json: @species_variation_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species_variation_observations/1
  # DELETE /species_variation_observations/1.json
  def destroy
    @species_variation_observation.destroy
    respond_to do |format|
      format.html { redirect_to species_variation_observations_url, notice: 'Species variation observation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species_variation_observation
      @species_variation_observation = SpeciesVariationObservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def species_variation_observation_params
      params.require(:species_variation_observation).permit(:observed_on, :user_id, :plot_id, :plant_id, :average_height, :average_width, :description, :photo)
    end
end
