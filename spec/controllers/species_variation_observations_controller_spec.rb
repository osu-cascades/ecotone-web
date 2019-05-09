require 'rails_helper'

RSpec.describe SpeciesVariationObservationsController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:species_variation_observation) { create(:species_variation_observation) }

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
      get :show, params: { id: species_variation_observation.id }
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
      get :edit, params: { id: species_variation_observation.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    before do
      @species_variation_observation = create(:species_variation_observation)
    end

    context 'with valid attributes' do
      it 'updates species variation observation attributes' do
        put :update, params: { id: @species_variation_observation, species_variation_observation: FactoryBot.attributes_for(:species_variation_observation, average_height: 2.2) }
        @species_variation_observation.reload
        expect(@species_variation_observation.average_height).to eq(2.2)
      end

      it 'redirects to the updated species variation observation' do
        put :update, params: { id: @species_variation_observation, species_variation_observation: FactoryBot.attributes_for(:species_variation_observation) }
        expect(response).to redirect_to @species_variation_observation
      end

      it 'produces correct flash notice' do
        put :update, params: { id: @species_variation_observation, species_variation_observation: FactoryBot.attributes_for(:species_variation_observation) }
        assert_equal 'Species variation observation was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @species_variation_observation, species_variation_observation: FactoryBot.attributes_for(:species_variation_observation, average_height: -2) }
        @species_variation_observation.reload
        expect(@species_variation_observation.average_height).to eq(1.5)
      end

      it 'does not redirect to updated species variation observation' do
        put :update, params: { id: @species_variation_observation, species_variation_observation: FactoryBot.attributes_for(:species_variation_observation, average_height: -2) }
        expect(response).to_not redirect_to @species_variation_observation
      end
    end
  end

  describe '#destroy' do
    before do
      @species_variation_observation = create(:species_variation_observation)
    end

    it 'deletes species variation observation' do
      expect { delete :destroy, params: { id: @species_variation_observation } }.to change(SpeciesVariationObservation, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @species_variation_observation }
      expect(response).to redirect_to species_variation_observations_url
    end
  end
end
