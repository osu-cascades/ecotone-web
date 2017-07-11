class PlantSamplesController < ApplicationController

  def index
    @plant_samples = PlantSample.all
  end

end
