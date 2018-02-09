class TreeSamplesController < ApplicationController
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_tree_sample, only: [:show, :edit, :update, :destroy]

  def index
    @tree_samples = TreeSample.all
  end

  def show; end

  def new
    @tree_sample = TreeSample.new
    @plots = Plot.all
    @plants = Plant.all
  end

  def edit
    @plots = Plot.all
    @plants = Plant.all
  end

  def create
    @tree_sample = TreeSample.new(tree_sample_params)
    @tree_sample.user = current_user
    respond_to do |format|
      if @tree_sample.save
        format.html { redirect_to @tree_sample, flash: {success: 'Tree sample was successfully created.'} }
        format.json { render :show, status: :created, location: @tree_sample }
      else
        @plots = Plot.all
        @plants = Plant.all
        format.html { render :new }
        format.json { render json: @tree_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tree_sample.update(tree_sample_params)
        format.html { redirect_to @tree_sample, flash: {success: 'Tree sample was successfully updated.'} }
        format.json { render :show, status: :ok, location: @tree_sample }
      else
        @plots = Plot.all
        @plants = Plant.all
        format.html { render :edit }
        format.json { render json: @tree_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tree_sample.destroy
    respond_to do |format|
      format.html { redirect_to tree_samples_url, flash: {notice: 'Tree sample was successfully destroyed.'} }
      format.json { head :no_content }
    end
  end

  private

    def set_tree_sample
      @tree_sample = TreeSample.find(params[:id])
    end

    def tree_sample_params
      params.require(:tree_sample).permit(:collected_on, :plot_id, :plant_id, :tag_number, :growth_stage, :dbh, :lower_canopy_height, :upper_canopy_height, :latitude, :longitude, :photo)
    end

end
