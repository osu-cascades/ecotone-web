class MycorrhizalFungiSamplesController < ApplicationController
  
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :set_mycorrhizal_fungi_sample, only: [:show, :edit, :update, :destroy]

  def index
    @mycorrhizal_fungi_samples = MycorrhizalFungiSample.order(collected_on: :desc).page(params[:page]).includes(:plot)
  end

  def show; end

  def new
    @mycorrhizal_fungi_sample = MycorrhizalFungiSample.new
    @plots = Plot.order(:plot_id)
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def edit
    @plots = Plot.order(:plot_id)
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def create
    @mycorrhizal_fungi_sample = MycorrhizalFungiSample.new(mycorrhizal_fungi_sample_params)
    @mycorrhizal_fungi_sample.user = current_user
    respond_to do |format|
      if @mycorrhizal_fungi_sample.save
        format.html { redirect_to @mycorrhizal_fungi_sample, flash: {success: 'Mycorrhizal fungi sample was successfully created.'} }
        format.json { render :show, status: :created, location: @mycorrhizal_fungi_sample }
      else
        @plots = Plot.order(:plot_id)
        @plants = Plant.order(Arel.sql('LOWER(common_name)'))
        format.html { render :new }
        format.json { render json: @mycorrhizal_fungi_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mycorrhizal_fungi_sample.update(mycorrhizal_fungi_sample_params)
        format.html { redirect_to @mycorrhizal_fungi_sample, flash: {success: 'Mycorrhizal fungi sample was successfully updated.'} }
        format.json { render :show, status: :ok, location: @mycorrhizal_fungi_sample }
      else
        @plots = Plot.order(:plot_id)
        @plants = Plant.order(Arel.sql('LOWER(common_name)'))
        format.html { render :edit }
        format.json { render json: @mycorrhizal_fungi_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mycorrhizal_fungi_sample.destroy
    respond_to do |format|
      format.html { redirect_to mycorrhizal_fungi_samples_url, flash: {success: 'Mycorrhizal fungi sample was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private

    def set_mycorrhizal_fungi_sample
      @mycorrhizal_fungi_sample = MycorrhizalFungiSample.find(params[:id])
    end


    def mycorrhizal_fungi_sample_params
      params.require(:mycorrhizal_fungi_sample).permit(:collected_on, :length, :magnification, :vesicle_count, :arbuscule_count, :visible_hyphae, :hyphae_coverage, :user_id, :plot_id, :plant_id, photo: [])
    end

end
