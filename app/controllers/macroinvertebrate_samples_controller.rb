class MacroinvertebrateSamplesController < ApplicationController
  
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_macroinvertebrate_sample, only: [:show, :edit, :update, :destroy]

  def index
    @macroinvertebrate_samples = MacroinvertebrateSample.order(collected_on: :desc).page(params[:page]).includes(:plot)
  end

  def show; end

  def new
    @macroinvertebrate_sample = MacroinvertebrateSample.new
    @plots = Plot.order(:plot_id)
  end

  def edit
    @plots = Plot.order(:plot_id)
  end

  def create
    @macroinvertebrate_sample = MacroinvertebrateSample.new(macroinvertebrate_sample_params)
    @macroinvertebrate_sample.user = current_user
    respond_to do |format|
      if @macroinvertebrate_sample.save
        format.html { redirect_to @macroinvertebrate_sample, flash: {success: 'Macroinvertebrate sample was successfully created.'} }
        format.json { render :show, status: :created, location: @macroinvertebrate_sample }
      else
        @plots = Plot.order(:plot_id)
        format.html { render :new }
        format.json { render json: @macroinvertebrate_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @macroinvertebrate_sample.update(macroinvertebrate_sample_params)
        format.html { redirect_to @macroinvertebrate_sample, flash: {success: 'Macroinvertebrate sample was successfully updated.'} }
        format.json { render :show, status: :ok, location: @macroinvertebrate_sample }
      else
        @plots = Plot.order(:plot_id)
        format.html { render :edit }
        format.json { render json: @macroinvertebrate_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @macroinvertebrate_sample.destroy
    respond_to do |format|
      format.html { redirect_to macroinvertebrate_samples_url, flash: {success: 'Macroinvertebrate sample was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private

    def set_macroinvertebrate_sample
      @macroinvertebrate_sample = MacroinvertebrateSample.find(params[:id])
    end

    def macroinvertebrate_sample_params
      params.require(:macroinvertebrate_sample).permit(:collected_on, :plot_id, :phylum, :location_within_plot, :quantity, :ecosystem_service, photo: [])
    end

end
