require 'rails_helper'

RSpec.describe MacroinvertebrateSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:macroinvertebrate_sample) { create(:macroinvertebrate_sample) }

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
      get :show, params: { id: macroinvertebrate_sample.id }
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
      it 'does not save new macroinvertebrate_sample' do
        macroinvertebrate_sample_params = FactoryBot.attributes_for(:invalid_macroinvertebrate_sample)
        expect { post :create, params: { macroinvertebrate_sample: macroinvertebrate_sample_params } }.to_not change(MacroinvertebrateSample, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { macroinvertebrate_sample: FactoryBot.attributes_for(:invalid_macroinvertebrate_sample) }
        expect(response).to_not redirect_to macroinvertebrate_samples_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: macroinvertebrate_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @macroinvertebrate_sample = create(:macroinvertebrate_sample)
    end

    context 'with valid attributes' do
      it 'updates macroinvertebrate sample attributes' do
        put :update, params: { id: @macroinvertebrate_sample, macroinvertebrate_sample: FactoryBot.attributes_for(:macroinvertebrate_sample, quantity: 22) }
        @macroinvertebrate_sample.reload
        expect(@macroinvertebrate_sample.quantity).to eq(22)
      end

      it 'redirects to the updated macroinvertebrate sample' do
        put :update, params: { id: @macroinvertebrate_sample, macroinvertebrate_sample: FactoryBot.attributes_for(:macroinvertebrate_sample) }
        expect(response).to redirect_to @macroinvertebrate_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @macroinvertebrate_sample, macroinvertebrate_sample: FactoryBot.attributes_for(:macroinvertebrate_sample) }
        assert_equal 'Macroinvertebrate sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @macroinvertebrate_sample, macroinvertebrate_sample: FactoryBot.attributes_for(:macroinvertebrate_sample, quantity: -2) }
        @macroinvertebrate_sample.reload
        expect(@macroinvertebrate_sample.quantity).to eq(1)
      end

      it 'does not redirect to updated macroinvertebrate sample' do
        put :update, params: { id: @macroinvertebrate_sample, macroinvertebrate_sample: FactoryBot.attributes_for(:macroinvertebrate_sample, quantity: -2) }
        expect(response).to_not redirect_to @macroinvertebrate_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @macroinvertebrate_sample = create(:macroinvertebrate_sample)
    end

    it 'deletes macroinvertebrate sample' do
      expect { delete :destroy, params: { id: @macroinvertebrate_sample } }.to change(MacroinvertebrateSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @macroinvertebrate_sample }
      expect(response).to redirect_to macroinvertebrate_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @macroinvertebrate_sample }
      assert_equal 'Macroinvertebrate sample was successfully deleted.', flash[:success]
    end
  end
end
