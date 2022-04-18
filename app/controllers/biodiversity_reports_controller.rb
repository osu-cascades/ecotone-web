class BiodiversityReportsController < ApplicationController
  
  before_action :login_required
  before_action :admin_required, only: :destroy
  before_action :load_plots_and_plants, only: [:new, :edit]
  before_action :set_biodiversity_report, only: [:show, :edit, :update, :destroy]

  def index
    @biodiversity_reports = BiodiversityReport.order(measured_on: :desc).page(params[:page])
  end

  def show
    @biodiversity_reports = BiodiversityReport.order(measured_on: :desc).all
  end

  def new
    @biodiversity_report = BiodiversityReport.new
  end

  def edit; end

  def create
    @biodiversity_report = BiodiversityReport.new(biodiversity_report_params)
    current_user.biodiversity_reports << @biodiversity_report
    if @biodiversity_report.save
      redirect_to biodiversity_reports_path
      flash[:success] = 'Biodiversity report was successfully created.'
    else
      load_plots_and_plants
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
    flash[:success] = 'Biodiversity report was successfully deleted.'
  end

  private

  def load_plots_and_plants
    @plots = Plot.order(:plot_id)
    @plants = Plant.order(Arel.sql('LOWER(common_name)'))
  end

  def set_biodiversity_report
    @biodiversity_report = BiodiversityReport.find(params[:id])
  end

  def biodiversity_report_params
    params.require(:biodiversity_report).permit(:measured_on, :measured_at, :plot_id,
      :temperature, :species_richness, :species_evenness, :biomass_estimate, :diversity_index, photo: [])
  end
  
end
