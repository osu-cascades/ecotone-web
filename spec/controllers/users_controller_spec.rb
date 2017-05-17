require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    allow(controller).to receive(:logged_in?).and_return(true)
  end

  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    it "returns http success" do
      skip
      get :show, params: { id: user.id }
      expect(respose).to have_http_status(:success)
    end
  end

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end

