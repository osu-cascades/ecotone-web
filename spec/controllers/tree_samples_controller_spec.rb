require 'rails_helper'

RSpec.describe TreeSamplesController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:tree_sample) { create(:tree_sample) }

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
      get :show, params: { id: tree_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: tree_sample.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @tree_sample = create(:tree_sample)
    end

    context 'with valid attributes' do
      it 'updates tree sample attributes' do
        put :update, params: { id: @tree_sample, tree_sample: FactoryBot.attributes_for(:tree_sample, dbh: 2.2) }
        @tree_sample.reload
        expect(@tree_sample.dbh).to eq(2.2)
      end

      it 'redirects to the updated tree sample' do
        put :update, params: { id: @tree_sample, tree_sample: FactoryBot.attributes_for(:tree_sample) }
        expect(response).to redirect_to @tree_sample
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @tree_sample, tree_sample: FactoryBot.attributes_for(:tree_sample) }
        assert_equal 'Tree sample was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @tree_sample, tree_sample: FactoryBot.attributes_for(:tree_sample, dbh: -2) }
        @tree_sample.reload
        expect(@tree_sample.dbh).to eq(1.5)
      end

      it 'does not redirect to updated tree sample' do
        put :update, params: { id: @tree_sample, tree_sample: FactoryBot.attributes_for(:tree_sample, dbh: -2) }
        expect(response).to_not redirect_to @tree_sample
      end
    end
  end

  describe '#destroy' do
    before do
      @tree_sample = create(:tree_sample)
    end

    it 'deletes tree sample' do
      expect { delete :destroy, params: { id: @tree_sample } }.to change(TreeSample, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @tree_sample }
      expect(response).to redirect_to tree_samples_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @tree_sample }
      assert_equal 'Tree sample was successfully deleted.', flash[:notice]
    end
  end
end
