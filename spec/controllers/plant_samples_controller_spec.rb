require 'rails_helper'

RSpec.describe PlantSamplesController, type: :controller do

  describe '#index' do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#export' do
    it "returns http success" do
      get :export, format: :csv
      expect(response).to have_http_status(:success)
    end

    it 'generates csv' do
      get :export, format: :csv
      expect(response.header['Content-Type']).to include 'application/octet-stream'
      expect(response.body).to include 'Plot,common_name,scientific_name,measured_on,measured_at,temperature,species_richness,diversity_index,abundance,percent_cover'
    end
  end

end