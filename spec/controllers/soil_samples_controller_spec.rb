require 'rails_helper'

RSpec.describe SoilSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:soil_sample) { create(:soil_sample) }

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
      get :show, params: { id: soil_sample.id }
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
      it 'does not save new soil_sample' do
        soil_sample_params = FactoryBot.attributes_for(:invalid_soil_sample)
        expect { post :create, params: { soil_sample: soil_sample_params } }.to_not change(SoilSample, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { soil_sample: FactoryBot.attributes_for(:invalid_soil_sample) }
        expect(response).to_not redirect_to soil_samples_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: soil_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @soil_sample = create(:soil_sample)
    end

    context 'with valid attributes' do
      it 'updates soil sample attributes' do
        put :update, params: { id: @soil_sample, soil_sample: FactoryBot.attributes_for(:soil_sample, ph_level: 2.2) }
        @soil_sample.reload
        expect(@soil_sample.ph_level).to eq(2.2)
      end

      it 'redirects to the updated soil sample' do
        put :update, params: { id: @soil_sample, soil_sample: FactoryBot.attributes_for(:soil_sample) }
        expect(response).to redirect_to @soil_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @soil_sample, soil_sample: FactoryBot.attributes_for(:soil_sample) }
        assert_equal 'Soil sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @soil_sample, soil_sample: FactoryBot.attributes_for(:soil_sample, ph_level: 22) }
        @soil_sample.reload
        expect(@soil_sample.ph_level).to eq(1.5)
      end

      it 'does not redirect to updated soil sample' do
        put :update, params: { id: @soil_sample, soil_sample: FactoryBot.attributes_for(:soil_sample, ph_level: 22) }
        expect(response).to_not redirect_to @soil_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @soil_sample = create(:soil_sample)
    end

    it 'deletes soil sample' do
      expect { delete :destroy, params: { id: @soil_sample } }.to change(SoilSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @soil_sample }
      expect(response).to redirect_to soil_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @soil_sample }
      assert_equal 'Soil sample was successfully deleted.', flash[:success]
    end
  end
end
