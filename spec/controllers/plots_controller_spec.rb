require 'rails_helper'

RSpec.describe PlotsController, type: :controller do

  let(:general_user) { FactoryGirl.build(:user) }
  let(:admin_user) { FactoryGirl.build(:user, :admin) }

  describe "GET #new" do

    it "returns http success" do
      allow(controller).to receive(:current_user).and_return(admin_user)
      get :new
      expect(response).to have_http_status(:success)
    end

    it "redirects if not admin" do 
      allow(controller).to receive(:current_user).and_return(general_user)
      get :new
      expect(response).to redirect_to :root
    end

  end

end

