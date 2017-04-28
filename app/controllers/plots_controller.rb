class PlotsController < ApplicationController

  before_action :set_plot, only: [:show, :edit, :update, :destroy]
  before_action :login_required
  before_action :admin_required

  def index
    @plots = Plot.all
  end

  def show
  end

  def new
    @plot = Plot.new
  end

  def edit
  end

  def create
    @plot = Plot.new(plot_params)
    if @plot.save
      redirect_to plots_path
      flash[:success] = 'Plot was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @plot.update(plot_params)
      redirect_to @plot
      flash[:success] = 'Plot was successfully updated.'
    else
      render 'edit'
    end    
  end

  def destroy
    @plot.destroy
    redirect_to plots_path
    flash[:success] = 'Plot was successfully destroyed.'
  end

  private

    def set_plot
      @plot = Plot.find(params[:id])
    end

    def plot_params
      params.require(:plot).permit(:plot_id, :latitude, :longitude, :elevation, :area, :location_description, :aspect, :origin, :inoculated, :initial_planting_date, :initial_succession, :photo)
    end
end
