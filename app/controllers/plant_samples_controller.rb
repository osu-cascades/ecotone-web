class PlantSamplesController < ApplicationController

  def index
    @plant_samples = PlantSample.all
  end

  def export
    @data = PlantSample.all
    plant_sample_attributes = ['abundance', 'percent_cover']
    bd_attributes = ['measured_on', 'measured_at', 'temperature', 'species_richness', 'diversity_index']
    plant_attributes = ['common_name', 'scientific_name']
    respond_to do |format|
      format.html
      format.csv { send_data @data.to_csv(plant_sample_attributes, bd_attributes, plant_attributes) }
    end
  end

end
