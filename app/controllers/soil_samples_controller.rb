class SoilSamplesController < ApplicationController
  
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_soil_sample, only: [:show, :edit, :update, :destroy]

  def index
    @soil_samples = SoilSample.order(collected_on: :desc).page(params[:page]).includes(:plot, :nutrients)
  end

  def show; end

  def new
    @soil_sample = SoilSample.new
    @soil_sample.build_default_nutrients(@soil_sample.nutrients.map { |sample| sample.name })
    @plots = Plot.order(:plot_id)
  end

  def edit
    @soil_sample.build_default_nutrients(@soil_sample.nutrients.map { |sample| sample.name })
    @plots = Plot.order(:plot_id)
  end

  def create
    @soil_sample = SoilSample.new(soil_sample_params)
    @soil_sample.user = current_user
    respond_to do |format|
      if @soil_sample.save
        format.html { redirect_to @soil_sample, flash: {success: 'Soil sample was successfully created.'} }
        format.json { render :show, status: :created, location: @soil_sample }
      else
        @plots = Plot.order(:plot_id)
        @soil_sample.build_default_nutrients(@soil_sample.nutrients.map { |sample| sample.name })
        format.html { render :new }
        format.json { render json: @soil_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @soil_sample.update(soil_sample_params)
        format.html { redirect_to @soil_sample, flash: {success: 'Soil sample was successfully updated.'} }
        format.json { render :show, status: :ok, location: @soil_sample }
      else
        @plots = Plot.order(:plot_id)
        format.html { render :edit }
        format.json { render json: @soil_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @soil_sample.destroy
    respond_to do |format|
      format.html { redirect_to soil_samples_url, flash: {success: 'Soil sample was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private

    def set_soil_sample
      @soil_sample = SoilSample.find(params[:id])
    end

    def soil_sample_params
      params.require(:soil_sample).permit(:collected_on, :plot_id, :collection_method, :ph_level, :temperature, :moisture,
         nutrients_attributes: [:id, :name, :amount, :level])
    end

end
