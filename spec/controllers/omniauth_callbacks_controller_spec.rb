require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  describe 'google_oauth2' do
    context 'successful authentication' do
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        request.env['omniauth.auth'] = create(:auth_hash, :authorized_domain)
        get :google_oauth2
      end

      let(:user) { User.find_by(email: 'example@example.com') }

      it 'should set :notice flash' do
        expect(controller).to set_flash[:notice].to('Successfully authenticated from Google account.')
      end

      it 'should set current_user to proper user' do
        expect(subject.current_user).to eq(user)
        expect(subject.user_signed_in?).to eq(true)
      end

      it 'should redirect to root' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'unsuccessful authentication' do
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        request.env['omniauth.auth'] = create(:auth_hash, :unauthorized_domain)
        get :google_oauth2
      end

      it 'should set :notice flash' do
        expect(controller).to set_flash[:alert].to('Authentication failed. Are you using your oregonstate.edu account?')
      end

      it 'should redirect to new user session path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
