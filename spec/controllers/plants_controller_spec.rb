require 'rails_helper'

RSpec.describe PlantsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      skip
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
