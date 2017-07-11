class PlantSamplesController < ApplicationController

  def index
    @biodiversity_reports = BiodiversityReport.all
  end

end
