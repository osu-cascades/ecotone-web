require 'rails_helper'

RSpec.describe PlantSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:plant_sample) { create(:plant_sample) }

  before do
    allow(controller).to receive(:current_user).and_return(admin_user)
    allow(controller).to receive(:user_signed_in?).and_return(true)
  end

  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it 'returns http success' do
      get :show, params: { id: plant_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    context 'with invalid attributes' do
      it 'does not save new plant sample' do
        plant_sample_params = FactoryBot.attributes_for(:invalid_plant_sample)
        expect { post :create, params: { plant_sample: plant_sample_params } }.to_not change(PlantSample, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { plant_sample: FactoryBot.attributes_for(:invalid_plant_sample) }
        expect(response).to_not redirect_to plant_samples_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: plant_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @plant_sample = create(:plant_sample)
    end

    context 'with valid attributes' do
      it 'updates plant sample attributes' do
        put :update, params: { id: @plant_sample, plant_sample: FactoryBot.attributes_for(:plant_sample, abundance: 2) }
        @plant_sample.reload
        expect(@plant_sample.abundance).to eq(2)
      end

      it 'redirects to the updated plant sample' do
        put :update, params: { id: @plant_sample, plant_sample: FactoryBot.attributes_for(:plant_sample) }
        expect(response).to redirect_to @plant_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @plant_sample, plant_sample: FactoryBot.attributes_for(:plant_sample) }
        assert_equal 'Plant sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @plant_sample, plant_sample: FactoryBot.attributes_for(:plant_sample, abundance: -2) }
        @plant_sample.reload
        expect(@plant_sample.abundance).to eq(1)
      end

      it 'does not redirect to updated plant sample' do
        put :update, params: { id: @plant_sample, plant_sample: FactoryBot.attributes_for(:plant_sample, abundance: -2) }
        expect(response).to_not redirect_to @plant_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @plant_sample = create(:plant_sample)
    end

    it 'deletes plant sample' do
      expect { delete :destroy, params: { id: @plant_sample } }.to change(PlantSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @plant_sample }
      expect(response).to redirect_to plant_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @plant_sample }
      assert_equal 'Plant sample was successfully deleted.', flash[:success]
    end
  end

  describe '#export' do
    it 'returns http success' do
      get :export, format: :csv
      expect(response).to have_http_status(:success)
    end

    skip 'generates csv' do
      get :export, format: :csv
      expect(response.header['Content-Type']).to include 'application/octet-stream'
      expect(response.body).to include 'Plot,common_name,scientific_name,measured_on,measured_at,temperature,species_richness,diversity_index,abundance,percent_cover'
    end
  end
end
