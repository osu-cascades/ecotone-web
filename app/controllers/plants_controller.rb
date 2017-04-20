class PlantsController < ApplicationController
  
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :login_required, except: [:new, :create]

  def index
    @plants = Plant.all
  end

  def show
  end

  def new
    @plant = Plant.new
  end

  def edit
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to @plant
      flash[:success] = 'Plant was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @plant.update(plant_params)
      redirect_to @plant
      flash[:success] = 'Plant was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_plant
      @plant = Plant.find(params[:id])
    end

    def plant_params
      params.require(:plant).permit(:common_name, :scientific_name, :habitat_type, :sunlight_tolerance)
    end

end
