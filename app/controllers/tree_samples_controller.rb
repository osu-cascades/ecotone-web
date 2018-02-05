class TreeSamplesController < ApplicationController
  before_action :set_tree_sample, only: [:show, :edit, :update, :destroy]

  # GET /tree_samples
  # GET /tree_samples.json
  def index
    @tree_samples = TreeSample.all
  end

  # GET /tree_samples/1
  # GET /tree_samples/1.json
  def show
  end

  # GET /tree_samples/new
  def new
    @tree_sample = TreeSample.new
  end

  # GET /tree_samples/1/edit
  def edit
  end

  # POST /tree_samples
  # POST /tree_samples.json
  def create
    @tree_sample = TreeSample.new(tree_sample_params)

    respond_to do |format|
      if @tree_sample.save
        format.html { redirect_to @tree_sample, notice: 'Tree sample was successfully created.' }
        format.json { render :show, status: :created, location: @tree_sample }
      else
        format.html { render :new }
        format.json { render json: @tree_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tree_samples/1
  # PATCH/PUT /tree_samples/1.json
  def update
    respond_to do |format|
      if @tree_sample.update(tree_sample_params)
        format.html { redirect_to @tree_sample, notice: 'Tree sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @tree_sample }
      else
        format.html { render :edit }
        format.json { render json: @tree_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tree_samples/1
  # DELETE /tree_samples/1.json
  def destroy
    @tree_sample.destroy
    respond_to do |format|
      format.html { redirect_to tree_samples_url, notice: 'Tree sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tree_sample
      @tree_sample = TreeSample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tree_sample_params
      params.require(:tree_sample).permit(:collected_on, :plot_id, :user_id, :plant_id, :tag_number, :growth_stage, :dbh, :lower_canopy_height, :upper_canopy_height, :latitude, :longitude, :photo)
    end
end
