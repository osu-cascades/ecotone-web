require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :login_required, only: [:fake_action]
    before_action :admin_required, only: [:fake_admin_action]

    def fake_action
      head :ok
    end

    def fake_admin_action
      head :ok
    end
  end

  before do
    routes.draw do
      get 'fake_action' => 'anonymous#fake_action'
      get 'fake_admin_action' => 'anonymous#fake_admin_action'
    end
  end

  describe '#login_required' do
    context 'user is logged in' do
      before { allow(controller).to receive(:user_signed_in?).and_return(true) }
      it 'does not invoke a redirect' do
        get :fake_action
        expect(response).to have_http_status(:success)
      end
    end

    context 'user is not logged in' do
      before { allow(controller).to receive(:user_signed_in?).and_return(false) }
      it 'invokes a redirect' do
        get :fake_action
        expect(response).to redirect_to(new_user_session_path)
      end
      it 'places a message in the flash' do
        get :fake_action
        expect(controller).to set_flash[:danger].to('Please sign in.')
      end
    end
  end

  describe '#admin_required' do
    context 'user is admin' do
      before { allow(controller).to receive(:current_user).and_return(build(:user, :admin)) }
      it 'does not invoke a redirect' do
        get :fake_admin_action
        expect(response).to have_http_status(:success)
      end
    end

    context 'user is not admin' do
      before { allow(controller).to receive(:current_user).and_return(build(:user)) }
      it 'invokes a redirect' do
        get :fake_admin_action
        expect(response).to redirect_to(root_url)
      end
      it 'places a message in the flash' do
        get :fake_admin_action
        expect(controller).to set_flash[:danger].to('Admin permissions required.')
      end
    end
  end
end
