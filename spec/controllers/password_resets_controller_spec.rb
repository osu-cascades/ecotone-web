require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  let(:user) { create(:user) }

  describe "#new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe "#edit" do

    before do
      allow(controller).to receive(:current_user).and_return(user) 
      allow(controller).to receive(:check_expiration).and_return(true)
    end 

    it "returns http success" do
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

  end

end
