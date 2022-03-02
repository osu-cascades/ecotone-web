require 'rails_helper'

RSpec.describe NonvascularPlantSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:nonvascular_plant_sample) { create(:nonvascular_plant_sample) }

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
      get :show, params: { id: nonvascular_plant_sample.id }
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
      it 'does not save new nonvascular_plant_sample' do
        nonvascular_plant_sample_params = FactoryBot.attributes_for(:invalid_nonvascular_plant_sample)
        expect { post :create, params: { nonvascular_plant_sample: nonvascular_plant_sample_params } }.to_not change(NonvascularPlantSample, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { nonvascular_plant_sample: FactoryBot.attributes_for(:invalid_nonvascular_plant_sample) }
        expect(response).to_not redirect_to nonvascular_plant_samples_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: nonvascular_plant_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @nonvascular_plant_sample = create(:nonvascular_plant_sample)
    end

    context 'with valid attributes' do
      it 'updates nonvascular_plant sample attributes' do
        put :update, params: { id: @nonvascular_plant_sample, nonvascular_plant_sample: FactoryBot.attributes_for(:nonvascular_plant_sample, description: 'All the vasculars') }
        @nonvascular_plant_sample.reload
        expect(@nonvascular_plant_sample.description).to eq('All the vasculars')
      end

      it 'redirects to the updated nonvascular_plant sample' do
        put :update, params: { id: @nonvascular_plant_sample, nonvascular_plant_sample: FactoryBot.attributes_for(:nonvascular_plant_sample) }
        expect(response).to redirect_to @nonvascular_plant_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @nonvascular_plant_sample, nonvascular_plant_sample: FactoryBot.attributes_for(:nonvascular_plant_sample) }
        assert_equal 'Nonvascular plant sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @nonvascular_plant_sample, nonvascular_plant_sample: FactoryBot.attributes_for(:nonvascular_plant_sample, description: nil) }
        @nonvascular_plant_sample.reload
        expect(@nonvascular_plant_sample.description).to eq('description of a nonvascular plant')
      end

      it 'does not redirect to updated nonvascular_plant sample' do
        put :update, params: { id: @nonvascular_plant_sample, nonvascular_plant_sample: FactoryBot.attributes_for(:nonvascular_plant_sample, description: nil) }
        expect(response).to_not redirect_to @nonvascular_plant_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @nonvascular_plant_sample = create(:nonvascular_plant_sample)
    end

    it 'deletes nonvascular_plant sample' do
      expect { delete :destroy, params: { id: @nonvascular_plant_sample } }.to change(NonvascularPlantSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @nonvascular_plant_sample }
      expect(response).to redirect_to nonvascular_plant_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @nonvascular_plant_sample }
      assert_equal 'Nonvascular plant sample was successfully deleted.', flash[:success]
    end
  end
end
