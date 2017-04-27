require 'rails_helper'

RSpec.describe PlantsController, type: :controller do

  let(:general_user) { FactoryGirl.build(:user) }
  let(:admin_user) { FactoryGirl.build(:user, :admin) }
  let(:plant) { FactoryGirl.create(:plant) }
  let(:invalid_plant) { FactoryGirl.build(:invalid_plant) }

  before(:each) do
    allow(controller).to receive(:current_user).and_return(admin_user)
  end

  describe "#index" do
    it "returns http success" do
      
      get :index
      expect(response).to have_http_status(:success)
    end

    it "redirects if not admin" do 
      allow(controller).to receive(:current_user).and_return(general_user)
      get :index
      expect(response).to redirect_to :root
    end
  end

  describe "#show" do
    it "returns http success" do
      get :show, id: plant.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "redirects if not admin" do 
      allow(controller).to receive(:current_user).and_return(general_user)
      get :new
      expect(response).to redirect_to :root
    end
  end

  describe "#create" do 
    context "with valid attributes" do
      it "creates new plant" do
        plant_params = FactoryGirl.attributes_for(:plant)
        expect { post :create, :plant => plant_params }.to change(Plant, :count).by(1)
      end

      it "redirects to index" do 
        post :create, plant: FactoryGirl.attributes_for(:plant)
        expect(response).to redirect_to plants_path
      end
    end

    context "with invalid attributes" do 
      it "does not save new plant" do
        plant_params = FactoryGirl.attributes_for(:invalid_plant)
        expect { post :create, :plant => plant_params }.to_not change(Plant, :count)
      end
    end
  end

  describe "#update" do

    before(:each) do
      @plant = build(:plant, common_name: "tulip", scientific_name: "tulipus", habitat_type: "soil", sunlight_tolerance: "good")
    end

    context "with valid attributes" do
      it "located the requested @plant" do
        skip
        put :update, id: @plant, plant: FactoryGirl.attributes_for(:plant)
        assigns(:plant).should eq(@plant)      
      end
    end
  end

end
