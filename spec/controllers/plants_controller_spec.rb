require 'rails_helper'

RSpec.describe PlantsController, type: :controller do

  describe "GET #new" do

    before do
      allow(controller).to receive(:current_user).and_return(FactoryGirl.build(:user, :admin))
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    #test: test that redirects if not admin
      #within test stub current user
        #allow(controller).to recieve(:current_user) { build }

  end
end