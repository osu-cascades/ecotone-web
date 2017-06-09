include SessionsHelper

class BiodiversityReportsController < ApplicationController
  before_action :login_required

  def index
    @biodiversity_reports = BiodiversityReport.all
  end

  def show
    @biodiversity_report = BiodiversityReport.find(params[:id])
  end

  def new
    @biodiversity_report = BiodiversityReport.new
  end

  def edit
    @biodiversity_report = BiodiversityReport.find(params[:id])
  end

  def create
    @biodiversity_report = BiodiversityReport.new(biodiversity_report_params)
    @current_user.biodiversity_reports << @biodiversity_report
    if @biodiversity_report.save
      redirect_to biodiversity_reports_path
      flash[:success] = 'Biodiversity report was successfully created.'
    else
      render :new
    end
  end

  def update
    if @biodiversity_report.update(biodiversity_report_params)
      redirect_to @biodiversity_report
      flash[:success] = 'Biodiversity report was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @biodiversity_report.destroy
    redirect_to biodiversity_reports_path
    flash[:success] = 'Biodiversity report was successfully destroyed.'
  end

  private

  def set_biodiversity_report
    @BiodiversityReport = BiodiversityReport.find(params[:id])
  end

  def biodiversity_report_params
    params.require(:biodiversity_report).permit(:date, :time, :temperature, :biomass_estimate, 
                                                :species_richness, :photo)
  end
end