require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  let(:user) { create(:user) }

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end

# password_resets     POST   /password_resets(.:format)           password_resets #create
# new_password_reset  GET    /password_resets/new(.:format)       password_resets #new
# edit_password_reset GET    /password_resets/:id/edit(.:format)  password_resets #edit
# password_reset      PATCH  /password_resets/:id(.:format)       password_resets #update
