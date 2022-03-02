require 'rails_helper'

RSpec.describe MycorrhizalFungiSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:mycorrhizal_fungi_sample) { create(:mycorrhizal_fungi_sample) }

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
      get :show, params: { id: mycorrhizal_fungi_sample.id }
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
      it 'does not save new mycorrhizal fungi sample' do
        mycorrhizal_fungi_sample_params = FactoryBot.attributes_for(:invalid_mycorrhizal_fungi_sample)
        expect { post :create, params: { mycorrhizal_fungi_sample: mycorrhizal_fungi_sample_params } }.to_not change(MycorrhizalFungiSample, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { mycorrhizal_fungi_sample: FactoryBot.attributes_for(:invalid_mycorrhizal_fungi_sample) }
        expect(response).to_not redirect_to mycorrhizal_fungi_samples_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: mycorrhizal_fungi_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @mycorrhizal_fungi_sample = create(:mycorrhizal_fungi_sample)
    end

    context 'with valid attributes' do
      it 'updates mycorrhizal fungi sample attributes' do
        put :update, params: { id: @mycorrhizal_fungi_sample, mycorrhizal_fungi_sample: FactoryBot.attributes_for(:mycorrhizal_fungi_sample, length: 2) }
        @mycorrhizal_fungi_sample.reload
        expect(@mycorrhizal_fungi_sample.length).to eq(2)
      end

      it 'redirects to the updated mycorrhizal fungi sample' do
        put :update, params: { id: @mycorrhizal_fungi_sample, mycorrhizal_fungi_sample: FactoryBot.attributes_for(:mycorrhizal_fungi_sample) }
        expect(response).to redirect_to @mycorrhizal_fungi_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @mycorrhizal_fungi_sample, mycorrhizal_fungi_sample: FactoryBot.attributes_for(:mycorrhizal_fungi_sample) }
        assert_equal 'Mycorrhizal fungi sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @mycorrhizal_fungi_sample, mycorrhizal_fungi_sample: FactoryBot.attributes_for(:mycorrhizal_fungi_sample, length: -2) }
        @mycorrhizal_fungi_sample.reload
        expect(@mycorrhizal_fungi_sample.length).to eq(1)
      end

      it 'does not redirect to updated mycorrhizal fungi sample' do
        put :update, params: { id: @mycorrhizal_fungi_sample, mycorrhizal_fungi_sample: FactoryBot.attributes_for(:mycorrhizal_fungi_sample, length: -2) }
        expect(response).to_not redirect_to @mycorrhizal_fungi_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @mycorrhizal_fungi_sample = create(:mycorrhizal_fungi_sample)
    end

    it 'deletes mycorrhizal fungi sample' do
      expect { delete :destroy, params: { id: @mycorrhizal_fungi_sample } }.to change(MycorrhizalFungiSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @mycorrhizal_fungi_sample }
      expect(response).to redirect_to mycorrhizal_fungi_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @mycorrhizal_fungi_sample }
      assert_equal 'Mycorrhizal fungi sample was successfully deleted.', flash[:success]
    end
  end
end
