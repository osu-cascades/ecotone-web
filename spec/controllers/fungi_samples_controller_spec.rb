require 'rails_helper'

RSpec.describe FungiSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:fungi_sample) { create(:fungi_sample) }

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
      get :show, params: { id: fungi_sample.id }
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
      it 'does not save new fungi_sample' do
        fungi_sample_params = FactoryBot.attributes_for(:invalid_fungi_sample)
        expect { post :create, params: { fungi_sample: fungi_sample_params } }.to_not change(FungiSample, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { fungi_sample: FactoryBot.attributes_for(:invalid_fungi_sample) }
        expect(response).to_not redirect_to fungi_samples_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: fungi_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @fungi_sample = create(:fungi_sample)
    end

    context 'with valid attributes' do
      it 'updates fungi sample attributes' do
        put :update, params: { id: @fungi_sample, fungi_sample: FactoryBot.attributes_for(:fungi_sample, size: 2.2) }
        @fungi_sample.reload
        expect(@fungi_sample.size).to eq(2.2)
      end

      it 'redirects to the updated fungi sample' do
        put :update, params: { id: @fungi_sample, fungi_sample: FactoryBot.attributes_for(:fungi_sample) }
        expect(response).to redirect_to @fungi_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @fungi_sample, fungi_sample: FactoryBot.attributes_for(:fungi_sample) }
        assert_equal 'Fungi sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @fungi_sample, fungi_sample: FactoryBot.attributes_for(:fungi_sample, size: -2) }
        @fungi_sample.reload
        expect(@fungi_sample.size).to eq(1.5)
      end

      it 'does not redirect to updated fungi sample' do
        put :update, params: { id: @fungi_sample, fungi_sample: FactoryBot.attributes_for(:fungi_sample, size: -2) }
        expect(response).to_not redirect_to @fungi_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @fungi_sample = create(:fungi_sample)
    end

    it 'deletes fungi sample' do
      expect { delete :destroy, params: { id: @fungi_sample } }.to change(FungiSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @fungi_sample }
      expect(response).to redirect_to fungi_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @fungi_sample }
      assert_equal 'Fungi sample was successfully deleted.', flash[:success]
    end
  end
end
