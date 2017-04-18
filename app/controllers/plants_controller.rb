class PlantsController < ApplicationController
  
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :login_required, except: [:new, :create]

  # GET /plants
  # GET /plants.json
  def index
    @plants = Plant.all
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to @plant
      flash[:success] = 'Plant was successfully created.'
    else
      render 'new'
    end
  end

  # PATCH/PUT /plants/1
  # PATCH/PUT /plants/1.json
  def update
    if @plant.update(plant_params)
      redirect_to @plant
      flash[:success] = 'Plant was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plant_params
      params.require(:plant).permit(:common_name, :scientific_name, :habitat_type, :sunlight_tolerance)
    end

end
