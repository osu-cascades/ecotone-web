class FungiSamplesController < ApplicationController

  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_fungi_sample, only: [:show, :edit, :update, :destroy]

  def index
    @fungi_samples = FungiSample.order(collected_on: :desc).page(params[:page])
  end

  def show; end

  def new
    @fungi_sample = FungiSample.new
    @plots = Plot.order(:plot_id)
  end

  def edit
    @plots = Plot.order(:plot_id)
  end

  def create
    @fungi_sample = FungiSample.new(fungi_sample_params)
    @fungi_sample.user = current_user
    respond_to do |format|
      if @fungi_sample.save
        format.html { redirect_to @fungi_sample, flash: {success: 'Fungi sample was successfully created.'} }
        format.json { render :show, status: :created, location: @fungi_sample }
      else
        @plots = Plot.order(:plot_id)
        format.html { render :new }
        format.json { render json: @fungi_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fungi_sample.update(fungi_sample_params)
        format.html { redirect_to @fungi_sample, flash: {success: 'Fungi sample was successfully updated.'} }
        format.json { render :show, status: :ok, location: @fungi_sample }
      else
        @plots = Plot.order(:plot_id)
        format.html { render :edit }
        format.json { render json: @fungi_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fungi_sample.destroy
    respond_to do |format|
      format.html { redirect_to fungi_samples_url, flash: {success: 'Fungi sample was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private

    def set_fungi_sample
      @fungi_sample = FungiSample.find(params[:id])
    end

    def fungi_sample_params
      params.require(:fungi_sample).permit(:collected_on, :plot_id, :location_within_plot, :size, :description, photo: [])
    end

end
