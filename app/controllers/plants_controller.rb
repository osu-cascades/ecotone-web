class PlantsController < ApplicationController

  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :login_required
  before_action :admin_required

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
      params.require(:plant).permit(:common_name, :scientific_name, :habitat_type, :sunlight_tolerance, :photo)
    end

end
