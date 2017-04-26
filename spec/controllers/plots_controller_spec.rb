require 'rails_helper'

RSpec.describe PlotsController, type: :controller do

  describe "GET #new" do

    before do
      allow(controller).to receive(:current_user).and_return(FactoryGirl.build(:user, :admin))
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  #test redirection works if not admin

end

