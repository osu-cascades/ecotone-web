require 'rails_helper'

RSpec.describe PlotsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      skip "need to login admin to access plots pages"
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end

