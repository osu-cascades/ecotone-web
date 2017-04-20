require 'rails_helper'

RSpec.describe "Plots", type: :request do
  describe "GET /plots" do
    it "works! (now write some real specs)" do
      get plots_path
      expect(response).to have_http_status(200)
    end
  end
end
