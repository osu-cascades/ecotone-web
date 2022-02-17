require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { build(:user) }
  let(:admin_user) { build(:user, :admin) }

  before do
    allow(controller).to receive(:user_signed_in?).and_return(true)
  end

  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    context 'user views own profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'returns http success' do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'admin views a profile' do
      before do
        allow(controller).to receive(:current_user).and_return(admin_user)
      end

      it 'returns http success' do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end
    end

    context "user views another's profile" do
      before do
        allow(controller).to receive(:current_user).and_return(other_user)
      end

      it 'redirects to root' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
