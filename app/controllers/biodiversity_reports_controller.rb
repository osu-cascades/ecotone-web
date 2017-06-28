class BiodiversityReportsController < ApplicationController
  before_action :login_required
  before_action :load_plots_and_plants, only: [:new, :edit]
  before_action :set_biodiversity_report, only: [:show, :edit, :update, :destroy]

  def index
    @biodiversity_reports = BiodiversityReport.all
  end

  def show
  end

  def new
    @biodiversity_report = BiodiversityReport.new
    @biodiversity_report.plant_samples.build
    @biodiversity_report.build_soil_sample
  end

  def edit
    @biodiversity_report.build_soil_sample unless @biodiversity_report.soil_sample
  end

  def create
    @biodiversity_report = BiodiversityReport.new(biodiversity_report_params)
    @current_user.biodiversity_reports << @biodiversity_report
    if @biodiversity_report.save
      redirect_to biodiversity_reports_path
      flash[:success] = 'Biodiversity report was successfully created.'
    else
      load_plots_and_plants
      @biodiversity_report.build_soil_sample unless @biodiversity_report.soil_sample
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
    @plots = Plot.all
    @plants = Plant.all
  end

  def set_biodiversity_report
    @biodiversity_report = BiodiversityReport.find(params[:id])
  end

  def biodiversity_report_params
    params.require(:biodiversity_report).permit(:measured_on, :measured_at, :temperature,
      :biomass_estimate, :species_richness, :photo, :plot_id,
      plant_samples_attributes: [:plant_id, :biodiversity_report_id, :abundance,
        :percent_cover, :biomass_estimate, :photo, :_destroy, :id],
      soil_sample_attributes: [:ph_level, :temperature, :biodiversity_report_id, :_destroy, :id])
  end

end
