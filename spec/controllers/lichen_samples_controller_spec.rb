require 'rails_helper'

RSpec.describe LichenSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:lichen_sample) { create(:lichen_sample) }

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
      get :show, params: { id: lichen_sample.id }
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
      it 'does not save new lichen_sample' do
        lichen_sample_params = FactoryBot.attributes_for(:invalid_lichen_sample)
        expect { post :create, params: { lichen_sample: lichen_sample_params } }.to_not change(LichenSample, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { lichen_sample: FactoryBot.attributes_for(:invalid_lichen_sample) }
        expect(response).to_not redirect_to lichen_samples_path
      end
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: lichen_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @lichen_sample = create(:lichen_sample)
    end

    context 'with valid attributes' do
      it 'updates lichen sample attributes' do
        put :update, params: { id: @lichen_sample, lichen_sample: FactoryBot.attributes_for(:lichen_sample, description: 'I have a lichen for you') }
        @lichen_sample.reload
        expect(@lichen_sample.description).to eq('I have a lichen for you')
      end

      it 'redirects to the updated lichen sample' do
        put :update, params: { id: @lichen_sample, lichen_sample: FactoryBot.attributes_for(:lichen_sample) }
        expect(response).to redirect_to @lichen_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @lichen_sample, lichen_sample: FactoryBot.attributes_for(:lichen_sample) }
        assert_equal 'Lichen sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @lichen_sample, lichen_sample: FactoryBot.attributes_for(:lichen_sample, description: nil) }
        @lichen_sample.reload
        expect(@lichen_sample.description).to eq('description of a lichen')
      end

      it 'does not redirect to updated lichen sample' do
        put :update, params: { id: @lichen_sample, lichen_sample: FactoryBot.attributes_for(:lichen_sample, description: nil) }
        expect(response).to_not redirect_to @lichen_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @lichen_sample = create(:lichen_sample)
    end

    it 'deletes lichen sample' do
      expect { delete :destroy, params: { id: @lichen_sample } }.to change(LichenSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @lichen_sample }
      expect(response).to redirect_to lichen_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @lichen_sample }
      assert_equal 'Lichen sample was successfully deleted.', flash[:success]
    end
  end
end
