require 'rails_helper'

# source: https://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html

RSpec.describe PlantsController, type: :controller do
  let(:general_user) { FactoryBot.build(:user) }
  let(:admin_user) { FactoryBot.build(:user, :admin) }
  let(:plant) { FactoryBot.create(:plant) }
  let(:invalid_plant) { FactoryBot.build(:invalid_plant) }

  before do
    allow(controller).to receive(:current_user).and_return(admin_user)
  end

  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it 'returns http success' do
      get :show, params: { id: plant.id }
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
    context 'with valid attributes' do
      it 'creates new plant' do
        plant_params = FactoryBot.attributes_for(:plant)
        expect { post :create, params: { plant: plant_params } }.to change(Plant, :count).by(1)
      end

      it 'redirects to index' do
        post :create, params: { plant: FactoryBot.attributes_for(:plant) }
        expect(response).to redirect_to plants_path
      end

      it 'produces correct flash notice' do
        post :create, params: { plant: FactoryBot.attributes_for(:plant) }
        assert_equal 'Plant was successfully created.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not save new plant' do
        plant_params = FactoryBot.attributes_for(:invalid_plant)
        expect { post :create, params: { plant: plant_params } }.to_not change(Plant, :count)
      end

      it 'does not redirect to index' do
        post :create, params: { plant: FactoryBot.attributes_for(:invalid_plant) }
        expect(response).to_not redirect_to plants_path
      end
    end
  end

  describe '#update' do
    before do
      @plant = create(:plant, common_name: 'Example', scientific_name: 'Example', habitat_type: 'Example', tolerance: 'Example', invasive: false)
    end

    context 'with valid attributes' do
      it 'updates plant attributes' do
        put :update, params: { id: @plant, plant: FactoryBot.attributes_for(:plant, common_name: 'CHANGED') }
        @plant.reload
        expect(@plant.common_name).to eq('CHANGED')
      end

      it 'redirects to the updated plant' do
        put :update, params: { id: @plant, plant: FactoryBot.attributes_for(:plant) }
        expect(response).to redirect_to @plant
      end

      it 'produces correct flash notice' do
        post :update, params: { id: @plant, plant: FactoryBot.attributes_for(:plant, common_name: 'CHANGED') }
        assert_equal 'Plant was successfully updated.', flash[:success]
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: @plant, plant: FactoryBot.attributes_for(:plant, scientific_name: nil) }
        @plant.reload
        expect(@plant.scientific_name).to eq('Example')
      end

      it 'does not redirect to updated plant' do
        put :update, params: { id: @plant, plant: FactoryBot.attributes_for(:invalid_plant) }
        expect(response).to_not redirect_to @plant
      end
    end
  end

  describe '#destroy' do
    before do
      @plant = create(:plant)
    end

    it 'deletes plant' do
      expect { delete :destroy, params: { id: @plant } }.to change(Plant, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @plant }
      expect(response).to redirect_to plants_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @plant }
      assert_equal 'Plant was successfully deleted.', flash[:success]
    end
  end

  describe 'all plants controller methods' do
    context 'user is not admin' do
      before do
        allow(controller).to receive(:current_user).and_return(general_user)
      end

      it '#new redirects' do
        get :new
        expect(response).to redirect_to :root
      end

      it '#create redirects' do
        get :create, params: { plant: FactoryBot.attributes_for(:plant) }
        expect(response).to redirect_to :root
      end

      before do
        @plant = create(:plant, common_name: 'Example', scientific_name: 'Example', habitat_type: 'Example', tolerance: 'Example', invasive: false)
      end

      it '#update redirects' do
        put :update, params: { id: @plant, plant: FactoryBot.attributes_for(:plant) }
        expect(response).to redirect_to :root
      end

      it 'redirects to index' do
        delete :destroy, params: { id: @plant }
        expect(response).to redirect_to :root
      end
    end
  end
end
