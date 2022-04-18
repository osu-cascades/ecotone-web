class LichenSamplesController < ApplicationController
  
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_lichen_sample, only: [:show, :edit, :update, :destroy]

  def index
    @lichen_samples = LichenSample.order(collected_on: :desc).page(params[:page])
  end

  def show; end

  def new
    @lichen_sample = LichenSample.new
    @plots = Plot.order(:plot_id)
  end

  def edit
    @plots = Plot.order(:plot_id)
  end

  def create
    @lichen_sample = LichenSample.new(lichen_sample_params)
    @lichen_sample.user = current_user
    respond_to do |format|
      if @lichen_sample.save
        format.html { redirect_to @lichen_sample, flash: {success: 'Lichen sample was successfully created.'} }
        format.json { render :show, status: :created, location: @lichen_sample }
      else
        @plots = Plot.order(:plot_id)
        format.html { render :new }
        format.json { render json: @lichen_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lichen_sample.update(lichen_sample_params)
        format.html { redirect_to @lichen_sample, flash: {success: 'Lichen sample was successfully updated.'} }
        format.json { render :show, status: :ok, location: @lichen_sample }
      else
        @plots = Plot.order(:plot_id)
        format.html { render :edit }
        format.json { render json: @lichen_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lichen_sample.destroy
    respond_to do |format|
      format.html { redirect_to lichen_samples_url, flash: {success: 'Lichen sample was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private

    def set_lichen_sample
      @lichen_sample = LichenSample.find(params[:id])
    end

    def lichen_sample_params
      params.require(:lichen_sample).permit(:collected_on, :plot_id, :location_within_plot, :description, photo: [])
    end

end
