class BiodiversityReportsController < ApplicationController
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :load_plots_and_plants, only: [:new, :edit]
  before_action :set_biodiversity_report, only: [:show, :edit, :update, :destroy]

  def index
    @biodiversity_reports = BiodiversityReport.order(measured_on: :desc).page(params[:page])
  end

  def show; end

  def new
    @biodiversity_report = BiodiversityReport.new
    build_samples_unless_exist
  end

  def edit
    build_samples_unless_exist
  end

  def create
    @biodiversity_report = BiodiversityReport.new(biodiversity_report_params)
    current_user.biodiversity_reports << @biodiversity_report
    if @biodiversity_report.save
      redirect_to biodiversity_reports_path
      flash[:success] = 'Biodiversity report was successfully created.'
    else
      load_plots_and_plants
      build_samples_unless_exist
      render :new
    end
  end

  def update
    @biodiversity_report = BiodiversityReport.find(params[:id])
    if @biodiversity_report.update(biodiversity_report_params)
      redirect_to @biodiversity_report
      flash[:success] = 'Biodiversity report was successfully updated.'
    else
      load_plots_and_plants
      build_samples_unless_exist
      render :edit
    end
  end

  def destroy
    @biodiversity_report = BiodiversityReport.find(params[:id])
    @biodiversity_report.destroy
    redirect_to biodiversity_reports_path
    flash[:success] = 'Biodiversity report was successfully destroyed.'
  end

  private

  def load_plots_and_plants
    @plots = Plot.order(:plot_id)
    @plants = Plant.order('LOWER(common_name)')
  end

  def build_samples_unless_exist
    @biodiversity_report.build_soil_sample unless @biodiversity_report.soil_sample
  end

  def set_biodiversity_report
    @biodiversity_report = BiodiversityReport.find(params[:id])
  end

  def biodiversity_report_params
    params.require(:biodiversity_report).permit(:measured_on, :measured_at, :temperature,
      :species_richness, :photo, :plot_id, :diversity_index,

      soil_sample_attributes: [:biodiversity_report_id, :_destroy, :id,
        :collection_method, :ph_level, :temperature, :moisture],

      macroinvertebrate_samples_attributes: [:biodiversity_report_id, :_destroy, :id,
        :phylum, :location_within_plot, :quantity, :ecosystem_service, :photo],

      plant_samples_attributes: [:biodiversity_report_id, :_destroy, :id,
        :plant_id, :abundance,:percent_cover, :photo])
  end
end
