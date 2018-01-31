class NonvascularPlantSamplesController < ApplicationController
  before_action :login_required
  before_action :set_nonvascular_plant_sample, only: [:show, :edit, :update, :destroy]

  def index
    @nonvascular_plant_samples = NonvascularPlantSample.all
  end

  def show; end

  def new
    @nonvascular_plant_sample = NonvascularPlantSample.new
    @plots = Plot.all
  end

  def edit
    @plots = Plot.all
  end

  def create
    @nonvascular_plant_sample = NonvascularPlantSample.new(nonvascular_plant_sample_params)
    @nonvascular_plant_sample.user = current_user
    respond_to do |format|
      if @nonvascular_plant_sample.save
        format.html { redirect_to @nonvascular_plant_sample, flash: {success: 'Nonvascular Plant sample was successfully created.'} }
        format.json { render :show, status: :created, location: @nonvascular_plant_sample }
      else
        @plots = Plot.all
        format.html { render :new }
        format.json { render json: @nonvascular_plant_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @nonvascular_plant_sample.update(nonvascular_plant_sample_params)
        format.html { redirect_to @nonvascular_plant_sample, flash: {success: 'Nonvascular Plant sample was successfully updated.'} }
        format.json { render :show, status: :ok, location: @nonvascular_plant_sample }
      else
        @plots = Plot.all
        format.html { render :edit }
        format.json { render json: @nonvascular_plant_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @nonvascular_plant_sample.destroy
    respond_to do |format|
      format.html { redirect_to nonvascular_plant_samples_url, flash: {success: 'Nonvascular Plant sample was successfully destroyed.'} }
      format.json { head :no_content }
    end
  end

  private

    def set_nonvascular_plant_sample
      @nonvascular_plant_sample = NonvascularPlantSample.find(params[:id])
    end

    def nonvascular_plant_sample_params
      params.require(:nonvascular_plant_sample).permit(:collected_on, :plot_id, :location_within_plot, :size, :description, :photo)
    end

end
